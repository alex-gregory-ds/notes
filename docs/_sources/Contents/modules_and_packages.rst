====================
Modules and Packages
====================

These notes describe modules and packages.

------------------
What is a Package?
------------------

A package in Python is a directory with a `__init__.py` file. The directory can contain python modules.

.. code-block:: console

    package/
        __init__.py
        module1.py
        module2.py
    module3.py

Modules do not necessarily have to be within a package like above.

From the root directory, the packages and modules can be imported with following syntax,

.. code-block:: python

    import package
    import package.module1
    import package.module2
    import module3

======================================
Importing between Modules in a Package
======================================

Suppose we have a package with two modules.

.. code-block:: console

    package/
        __init__.py
        module1.py
        module2.py

Suppose module 1 has a function to print a string.

.. code-block:: python

    # module1.py

    def print_message()
        print("This is module 1")

Suppose module uses this function.

.. code-block:: python

    # module2.py
    from package import module1

    def print_message_from_module1()
        print("Printing message from module 1")

