Linux
=====

This article contains some random useful information on using Linux.

The APT Package Manager
-----------------------

The Advanced Package Tool (APT) is a command-line package manager used in
Debian-based Linux distributions like Ubuntu.

Keeping Packages Up to Date
^^^^^^^^^^^^^^^^^^^^^^^^^^^

To update APT's package index, run the following command:

.. code::

   sudo apt update

This will not update any installed packages, it will only update the package
index. To update your installed packages with the new versions in the package
index, use the following command:

.. code::

   sudo apt upgrade

Installing New Packages
^^^^^^^^^^^^^^^^^^^^^^^

New packages can be installed with :code:`apt install`. For example:


.. code::

   sudo apt install python3.10

You may find that your package is not available in APT's package indexes in
which case you may need to find another package index.

For example, as of writing (2025-05-27), python 3.12 is not available on the
APT package index as shown below.

.. code::

   $ sudo apt install python3.12
   Reading package lists... Done
   Building dependency tree... Done
   Reading state information... Done
   E: Unable to locate package python3.12
   E: Couldn't find any package by glob 'python3.12'


Deadsnakes is a personal package archive (PPA) that contains more recent python
versions including python 3.12. You can add PPAs with the following command:

.. code::

   sudo add-apt-repository ppa:deadsnakes/ppa
   sudo apt update

After which :code:`sudo apt install python3.12` should work as expected.
