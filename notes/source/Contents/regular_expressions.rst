===================
Regular Expressions
===================

A regular expression (often shortened to regex) is a sequence of characters
that can be used to search for patterns of text.

^^^^^^^^^^^^^^^
Regex in Python
^^^^^^^^^^^^^^^

The python standard library has the :code:`re` module for working with regular
expressions. This section provides a brief overview of some regex syntax.

Regex strings are given the prefix :code:`r` before single or double quotes.

.. code-block:: python

   pattern = r"Hello"

The function :code:`re.match` can be used to search for regex patterns inside
other strings.

.. code-block:: python

   >>> import re
   >>> pattern = r"Hello"
   >>> string = "Hello, World!"
   >>> re.match(pattern, string)
   <re.Match object; span=(0, 5), match='Hello'>

The :code:`span` attribute in the object returned from :code:`re.match` tells
us the first 5 characters of :code:`string` matched :code:`pattern`. Casting
the object to a boolean gives :code:`True` if there is a match and
:code:`False` if there is not a match.

.. code-block:: python

   >>> pattern = r"Hello"
   >>> string = "Hello, World!"
   >>> bool(re.match(pattern, string))
   True

Regex can be used to match more complicated patterns. The list below describes
some of regex syntax.

:code:`.`
    Matches any single character other than the newline character (:code:`\n`).

    .. code-block:: python

       >>> bool(re.match(r"H.llo", "Hello, World!"))
       True
       >>> bool(re.match(r"H.llo", "Hxllo, World!"))
       True
       >>> bool(re.match(r"H.llo", "Hxxllo, World!"))
       False
       >>> bool(re.match(r"H.llo", "H\nllo, World!"))
       False


:code:`?`
    Matches the previous regex for 0 or 1 repetitions.

    .. code-block:: python

       >>> bool(re.match(r"He?llo", "Hello, World!"))
       True
       >>> bool(re.match(r"He?llo", "Hllo, World!"))
       True
       >>> bool(re.match(r"He?llo", "Heello, World!"))
       False
       >>> bool(re.match(r"He?llo", "Hxllo, World!"))
       False

:code:`+`
    Matches the previous regex for 1 or more repetitions.

    .. code-block:: python

       >>> bool(re.match(r"He+llo", "Hello, World!"))
       True
       >>> bool(re.match(r"He+llo", "Heeello, World!"))
       True
       >>> bool(re.match(r"He+llo", "Hllo, World!"))
       False

:code:`*`
    Matches the previous regex for 0 or more repetitions.

    .. code-block:: python

       >>> bool(re.match(r"He*llo", "Hello, World!"))
       True
       >>> bool(re.match(r"He*llo", "Heeello, World!"))
       True
       >>> bool(re.match(r"He*llo", "Hllo, World!"))
       True

:code:`^`
    Matches the start of the string.

    .. code-block:: python

       >>> bool(re.match(r"^Hello", "Hello, World!"))
       True
       >>> bool(re.match(r"^World", "Heeello, World!"))
       False

:code:`$`
    Matches the end of the string.

    .. code-block:: python

       >>> bool(re.match(r"foo$", "foobar"))
       False
       >>> bool(re.match(r"bar$", "foobar"))
       False
       >>> bool(re.match(r"foobar$", "foobar"))
       True

:code:`{m,n}`
    Match next :code:`m` to :code:`n` characters to previous regex.

    .. code-block:: python

       >>> bool(re.match(r"He{3}llo", "Hello, World!"))
       False
       >>> bool(re.match(r"He{3}llo", "Heeello, World!"))
       True
       >>> bool(re.match(r"He{2,3}llo", "Heello, World!"))
       True
       >>> bool(re.match(r"He{2,3}llo", "Heeello, World!"))
       True
       >>> bool(re.match(r"He{2,3}llo", "Heeeello, World!"))
       False

:code:`[]`
    Used to define character sets.

    .. code-block:: python

       >>> # Match 6 chars to chars 'f', 'o', 'b', 'a', and 'r'
       >>> bool(re.match(r"[fobar]{6}", "foobar"))
       True
       >>> bool(re.match(r"[fobar]{6}", "fo3bar"))
       False
       >>> # Match 6 chars to chars 'a' to 'z'
       >>> bool(re.match(r"[a-z]{6}", "foobar"))
       True
       >>> bool(re.match(r"[a-z]{6}", "fo3bar"))
       False
       >>> # Match 6 chars to chars 'a' to 'z' or '1' to '9'
       >>> bool(re.match(r"[a-z1-9]{6}", "fo3bar"))
       True
       >>> # Match 6 chars to chars 'A' to 'Z'
       >>> bool(re.match(r"[A-Z]{6}", "foobar"))
       False
       >>> # Match 6 chars to chars 'A' to 'Z'
       >>> bool(re.match(r"[A-Z]{6}", "FOOBAR"))
       True

:code:`()`
    Used to define groups.

    .. code-block:: python

       >>> # Matches to 'a' or 'bc'
       >>> bool(re.match(r"(a|bc)", "a"))
       True
       >>> bool(re.match(r"(a|bc)", "b"))
       True
       >>> bool(re.match(r"(a|bc)", "d"))
       False

^^^^
Grep
^^^^

Grep is a program common on most Unix-like systems. It is used for finding
patterns in text. Suppose the file :code:`text.txt` contains the follow text.

.. code-block:: console

   Line 1
   Line 2
   This is the final line

Here are some examples of how to use grep.

.. code-block:: console

   $ grep This text.txt
   Line 1
   Line 2
   $ grep --invert-match This text.txt
   This is the final line
   $ grep --ignore-case this text.text
   This is the final line
   $ grep --file=text.txt --regexp=Line
   Line 1
   Line 2
   $ grep --count Line text.txt
   2
   $ grep ^Line (1|2) file1.txt
   zsh: no matches found: (1|2)
   $ grep "^Line (1|2)" file1.txt
   $ grep -E "^Line (1|2)" file1.txt
   Line 1
   Line 2

-------------------
Grep Multiple Files
-------------------

Suppose we have the following directory structure.

.. code-block:: console

   directory
      file1.txt
      file2.txt

Suppose :code:`directory/file1.txt` has the following text.

.. code-block:: console

   Line 1 in file1
   Line 2 in file1
   This is the final line in file 1

And :code:`directory/file2.txt` has the following text.

.. code-block:: console

   Line 1 in file2
   Line 2 in file2
   This is the final line in file 2

We can grep patterns in multiple files.

.. code-block:: console

   $ grep Line directory/*.txt
   file1.txt:Line 1 in file1
   file1.txt:Line 2 in file1
   file2.txt:Line 1 in file2
   file2.txt:Line 2 in file2
   $ grep Line --recursive directory
   file1.txt:Line 1 in file1
   file1.txt:Line 2 in file1
   file2.txt:Line 1 in file2
   file2.txt:Line 2 in file2

