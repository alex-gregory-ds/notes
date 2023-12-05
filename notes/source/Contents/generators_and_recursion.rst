========================
Generators and Recursion
========================

Write a function to generate the length 2 combinations for the elements of a list.  

One way to think about this is as a matrix. Suppose we have a list :math:`[i_0, i_1, \dots, i_{n-1}]`. Write out each permutation of pairs (with replacement) as a matrix.

.. math::

   \begin{matrix}
       (i_0, i_0) & (i_0, i_1) & \dots & (i_0, i_{n-1}) \\
       (i_1, i_0) & (i_1, i_1) & \dots & (i_1, i_{n-1}) \\
       \vdots     & \vdots     &       & \vdots         \\
       (i_{n-1}, i_0) & (i_{n-1}, i_1) & \dots & (i_{n-1}, i_{n-1}) \\
   \end{matrix}

The matrix contains all possible permutations (with replacement). The matrix is symmetric meaning for each pair :math:`(i_a, i_b)` below the diagonal, the pair :math:`(i_b, i_a)` is above the diagonal. This means the set of combination pairs for our list is above the diagonal. Therefore, we only have to generate the pairs above the diagonal.

Here is another way of saying this. Suppose again we have a list :math:`i = [i_0, i_1, \dots, i_{n-1}]`. Suppose we generate all the permutations that start with :math:`i_a` for :math:`a=0, 1, \dots, b - 1` where :math:`b \leq n - 1`. Then, for the list of permutations that start with :math:`i_b`, then :math:`(i_j, i_b)` has already been generated if :math:`j < b`.

Let us write our function to generate combinations.

.. code::

   >>> def combinations(items):
   ...    for i, first_item in enumerate(items):
   ...        for second_item in items[i + 1:]:
   ...            yield first_item, second_item
   >>> [i for i in combinations([1, 2, 3, 4, 5])]
   >>> [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]

What about the case where :math:`r=3`. Let us try extending the rule we defined above and used it for the case where :math:`r=3`.

.. code::

   >>> def combinations(items):
   ...    for i, first_item in enumerate(items[:-2]):
   ...        for j, second_item in enumerate(items[i + 1:-1]):
   ...            for third_item in items[i + j + 2:]:
   ...                yield first_item, second_item, third_item
   >>> [i for i in combinations([1, 2, 3, 4, 5])]
   >>> [(1, 2, 3), (1, 2, 4), (1, 3, 4), (2, 3, 4)]
