=======================
Managing Users in Linux
=======================

In Linux, users and groups allow admins to limit the files that can be accessed and functions that can be executed.

User information is stored in :code:`/etc/passwd` and can be displayed using :code:`cat`. Each row shows the information for a different user. Each user's information has the following form.

.. code:: console

   username:enctrypted_password:uid:gid:comments:home_directory:shell

:code:`uid` is the user ID number and :code:`gid` is the primary group ID number.

~~~~~~~~~~~~~~
Creating Users
~~~~~~~~~~~~~~

Users can be created using the :code:`useradd` command. For example, we can use the following to create a user called :code:`example_user`.

.. code:: console

   $ useradd --create-home example_user

This creates a user called :code:`example_user` and creates a home directory for the user. The home directory for list user can be found in the :code:`/home` directory.

.. code:: console

   $ ls /home
   example_user

We can also see the new user in :code:`/etc/passwd`.

.. code:: console

   $ cat /etc/passwd | grep example_user
   example_user:x:1000:1000::/home/example_user:/bin/sh

We can change to :code:`example_user` using the :code:`su` (switch user) command.

.. code:: console

   $ su example_user
   $ whoami
   example_user
   $ id
   uid=1000(example_user) gid=1000(example_user) groups=1000(example_user)

The :code:`id` command shows the user id :code:`uid`, the group id :code:`gid` and the groups the user belongs to. Note that when we created :code:`example_user` a group called :code:`example_user` was also created.

~~~~~~~~~~~~~~~
Creating Groups
~~~~~~~~~~~~~~~

Groups can be created using the :code:`groupadd` command. Let us create a group called :code:`example_group`.

.. code:: console

   $ groupadd example_group

Information about the groups in the system can be found in the :code:`/etc/group` file.

.. code:: console

   $ cat /etc/group | grep example_group
   example_group:x:1001:

The output has the following form.

.. code::

   group_name:encrypted_password:gid:

Let us see which groups :code:`example_user` is part of.

.. code::

   $ groups example_user
   example_user : example_user

The user :code:`example_user` is part of the :code:`example_user` group.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Adding a User to an Existing Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can add :code:`example_user` to an existing group using the :code:`usermod` command.

.. code::

   $ usermod -a -G example_group example_user

Now let us print the groups that :code:`example_user` belongs to.

.. code::

   $ groups example_user
   example_user : example_user example_group

User :code:`example_user` is a member of the groups :code:`example_user` and :code:`example_group`.

~~~~~~~~~~
References
~~~~~~~~~~

.. _RHAT: https://www.redhat.com/sysadmin/linux-user-group-management

