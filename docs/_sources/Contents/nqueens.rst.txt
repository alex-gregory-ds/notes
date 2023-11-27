========
N-Queens
========

---------------------------------------------
Getting the Binary Representation of Integers
---------------------------------------------

One can get the binary string for an integer using f-strings.

.. code::

   >>> printf(f"1:b")
   1
   >>> printf(f"2:b")
   10
   >>> printf(f"3:b")
   11
   >>> printf(f"4:b")
   100
   >>> printf(f"9:b")
   1001

When reading the binary representation, start from the right. So, `1001` is `1 + 8`.

------------------------------------
Solving N-Queens in a Functional Way
------------------------------------

In the cpython testing suite, there is a class for solving the N-Queens problem called `Queens`.

.. code::

   class Queens:
       def __init__(self, n):
           self.n = n
           rangen = range(n)
   
           # Assign a unique int to each column and diagonal.
           # columns:  n of those, range(n).
           # NW-SE diagonals: 2n-1 of these, i-j unique and invariant along
           # each, smallest i-j is 0-(n-1) = 1-n, so add n-1 to shift to 0-
           # based.
           # NE-SW diagonals: 2n-1 of these, i+j unique and invariant along
           # each, smallest i+j is 0, largest is 2n-2.
   
           # For each square, compute a bit vector of the columns and
           # diagonals it covers, and for each row compute a function that
           # generates the possibilities for the columns in that row.
           self.rowgenerators = []
           for i in rangen:
               rowuses = [(1 << j) |                  # column ordinal
                          (1 << (n + i-j + n-1)) |    # NW-SE ordinal
                          (1 << (n + 2*n-1 + i+j))    # NE-SW ordinal
                               for j in rangen]
   
               breakpoint()
               def rowgen(rowuses=rowuses):
                   for j in rangen:
                       uses = rowuses[j]
                       if uses & self.used == 0:
                           self.used |= uses
                           yield j
                           self.used &= ~uses
   
               self.rowgenerators.append(rowgen)
   
       # Generate solutions.
       def solve(self):
           self.used = 0
           for row2col in conjoin(self.rowgenerators):
               yield row2col
   
       def printsolution(self, row2col):
           n = self.n
           assert n == len(row2col)
           sep = "+" + "-+" * n
           print(sep)
           for i in range(n):
               squares = [" " for j in range(n)]
               squares[row2col[i]] = "Q"
               print("|" + "|".join(squares) + "|")
               print(sep)

Let us talk through how this code works. The constructor has the argument `n` which is the size of the board. A list called `rowgenerators` is then created which stores the columns, and diagonals that are covered by each square. The columns/diagonals covered by each square are stored as a binary strings created in the `rowuses` list comprehension.

This list comprehension involves several binary operations. Let us look at the output for the first row when `n` is 4.

.. code::

   >>> n = 4
   >>> i = 0
   >>> rowuses = [
   ... (1 << j) |
   ... (1 << (n + i-j + n-1)) |
   ... (1 << (n + 2*n-1 + i+j))
   ... for j in rangen]
   >>> rowuses = [2177, 4162, 8228, 16408]

The list `rowuses` is a list of seemingly random integers. These integers represent the columns and diagonals that each square in the first row cover. Look at the binary representation of the first number.

.. code::

   >>> f"{2177:b}"
   '100010000001'

This string contains has three 1's. The top left square covers 1 column, 1 NW-SE diagonal, and 1 NE-SW diagonal. Perhaps each of these 1's represent the columns and diagonals? In fact, the right most digit is a 1, perhaps this means the first column is covered?

We have a few ideas so let us breakdown what each term in the list comprehension does.

-----------------
Term 1 `(1 << j)`
-----------------

In the comment, it says the first term is for the column ordinal. In other words, the first term deals with representing the columns that are covered. Let us check the values of `(1 << j)` for the different values of `j`.

.. code::

   >>> f"{1 << 0:b}"
   1
   >>> f"{1 << 1:b}"
   10
   >>> f"{1 << 2:b}"
   100
   >>> f"{1 << 3:b}"
   1000

These binary strings are used to represent covers columns 1, 2, 3, and 4 respectively. In the binary for the top left square, `100010000001`, the 1 on the right tells us this square covers the first column.

-----------------------------
Term 2 `1 << (n + i-j + n-1)`
-----------------------------

This term handles the NW-SE diagonals. Recall the comment about the NW-SE diagonals.

.. code::

   # NW-SE diagonals: 2n-1 of these, i-j unique and invariant along
   # each, smallest i-j is 0-(n-1) = 1-n, so add n-1 to shift to 0-
   # based.

Let us break down each part of this comment. There are `2n-1` NW-SE diagonals. There are `n-1` NW-SE diagonals that start on the left side of the board (not including the diagonal) and there are `n-1` NW-SE diagonals that start along the top of the board (not including the diagonal). Including the diagonal, we have `n-1 + n-1 + 1 = 2n-1` NW-SE diagonals.

Taking the column index `j` from the row index `i` gives a unique integer for each diagonal that does not change along the diagonal. Let us write out `i-j` for `n` is `4`.

+----+----+----+----+
|  0 | -1 | -2 | -3 |
+----+----+----+----+
|  1 |  0 | -1 | -2 |
+----+----+----+----+
|  2 |  1 |  0 | -1 |
+----+----+----+----+
|  3 |  2 |  1 |  0 |
+----+----+----+----+

There is a unique integer for each NW-SE diagonal and the integer does not change along the diagonal. Negative integers are handled slightly differently in python, so to keep everything simple add a buffer of `n-1`. Doing this, the matrix becomes.

+----+----+----+----+
|  3 |  2 |  1 |  0 |
+----+----+----+----+
|  4 |  3 |  2 |  1 |
+----+----+----+----+
|  5 |  4 |  3 |  2 |
+----+----+----+----+
|  6 |  5 |  4 |  3 |
+----+----+----+----+

So, in `1 << n + i-j + n-1`, the term `i-j` uniquely represents the NW-SE diagonal that the square covers and `n-1` is used to make the negative `i-j`'s positive. So what does the final `n` do? The final `n` is to make sure the digits from the `1 << j` term are not overwritten.

So, `i << n + i-j + n-1` turns on the bit which uniquely represents the NW-SE diagonal that the square covers without overwriting the bit which covers the column the square covers.

What is the minimum value of `1 << n + i-j + n-1`? The minimum value occurs when `i` and `j` are zero. When `n` is `4`, this means,

.. code::

   >>> f"{1 << 4 + 0 - 0 + 3 << 0:b}"
   '10000000'

Including the first term, we get,

.. code::

   >>> f"{1 << 0 | 1 << 4 + 0 - 0 + 3 << 0:b}"
   '10000001'

The `1` on the right represents the first column being covered, the `1` on the left represents the main diagonal being covered.

-------------------------------
Term 3 (1 << (n + 2*n-1 + i+j))
-------------------------------

Term 3 is very similar to term 2. This term covers the NE-SW diagonals. Recall the comment for these diagonals.

.. code::

   # NE-SW diagonals: 2n-1 of these, i+j unique and invariant along
   # each, smallest i+j is 0, largest is 2n-2.

By the same logic as before, there are `2n-1` NE-SW diagonals. Let us write out the `i + j` terms when `n` is 4.


+----+----+----+----+
|  0 |  1 |  2 |  3 |
+----+----+----+----+
|  1 |  2 |  3 |  4 |
+----+----+----+----+
|  2 |  3 |  4 |  5 |
+----+----+----+----+
|  3 |  4 |  5 |  6 |
+----+----+----+----+

Each NE-SW diagonal is represented by a unique integer. All these integers are positive, so we do not have to add `n-1` like before. So, in term 3, `i+j` is used to uniquely identify the NE-SW diagonal.

We still need to make sure we do not overwrite the `1`'s from term 1 and term 2. This is done by adding `n + 2*n-1` to `i+j`. Similar to before `n` ensures we do not overwrite the bits from term 1, but what about `2*n-1`?

From term 2, the maximum value of `i-j + n-1` is `n-1 - 0 + n-1 = 2*n-2`. So, adding `2*n-1` ensures that we do not overwrite the `1` from term 2.
