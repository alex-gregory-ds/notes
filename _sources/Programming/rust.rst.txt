Rust
====

This is designed to be a quick reference for rust.

Installing Rust and Creating a New Project
------------------------------------------

The instructions for install rust can be found
`here <https://www.rust-lang.org/tools/install>`_. Once installed, use the
:code:`cargo new` command to create a new project:

.. code:: shell

   cargo new myproject

This creates a directory called :code:`myproject` which contains a
:code:`Cargo.toml` a :code:`src` directory which contains a :code:`main.rs`
file. The :code:`main.rs` files contains a simple **hello world** function:

.. code:: rust

   fn main() {
       println!("Hello, world!");
   }

Use :code:`cargo run` to run the program:

.. code:: shell

   $ cargo run
      Compiling myproject v0.1.0 (/home/alex/documents/rust/myproject)
       Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.45s
        Running `target/debug/myproject`
   Hello, world!

Mutable and Immutable Variables
-------------------------------

Variables are immutable by default unless the :code:`mut` keyword is used.
Without the :code:`mut` keyword, in place addition is invalid:

.. code:: rust

   let x = 1;  // Immutable
   let mut y = 2;  // Mutable

    x += 1;  // Invalid
    y += 1;  // Valid

Data Types
----------

The rust compiler will attempt to infer the type of your variables if a type is
not provided. Rust has rules for which data type it defaults to.

.. code:: rust

   let a1 = 10; // 32-bit integer
   let a2: i64 = 15; // 64-bit integer

   let b1 = 1.0; // 64-bit float
   let b2: f32 = 2.0; // 32-bit float

   let c1 = true; // bool
   let c2 = false; // bool

Statements and Expressions
--------------------------

Statements are instructions that perform some action and do not return a value.
Expressions evaluate to a resultant value. Here are some examples:

.. code:: rust

   // The line below is a statement but the 2 is an expression that evaluates to
   // the value 2.
   let x = 2;

   // The curly brackets part is an expression because it evaluates to 4
   let y = {
        let x = 3;
        x + 1  // This is equivalent to 'return x + 1'
   }

Expressions do not include semicolons at the end of the line.

Rust's Ownership Model
----------------------

Rust's ownership system has two fundamental rules:

* Each value has single owner.
* When the owner goes out of scope, the value is dropped.

The following examples demonstrate rust's ownership system in practice.

Example: Giving Ownership
^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the following example, we create a string on the heap and assign it to
:code:`x`. We then assign :code:`y` to :code:`x`.

.. code:: rust

   let x = String::from("Hello, world");
   let y = x;  // Ownership of 'x' is given to 'y'

   // 'x' no longer owns 'hello world' so the following is invalid
   println!("{}", x);  // ERROR: Borrow of moved value 'x'

In rust, a value can be owned by only one thing at a time, so :code:`x` and
:code:`y` cannot both own :code:`Hello, world`.

Example: Functions take Ownership
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When a variable is directly passed to a function, ownership of data is given to
the function.  In the next example, we create a simple function to print a line
of text and pass a variable to that function.

.. code:: rust

   fn print_text(line: String) {
       println!("The is from 'print_text': {}", line);
   }

   fn main() {
       let x = String::from("Hello, world");
       print_text(x);
       println!("{}", x);  // ERROR: Borrow of moved value 'x'
   }

When :code:`x` is passed to :code:`print_text`, it is given ownership of
:code:`x` so it cannot be used again.

Example: Looping over a list Gives up its Ownership
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the code example below, we loop over a list of strings. After this loop, the
original variable assigned to the variable now longer has onwership of the data.

.. code:: rust

   fn main() {
       let lines = [
          String::from("Line 1"), String::from("Line 2"), String::from("Line 3")
       ]
       for line in lines {
       }
       println!("{:?}", lines);  // ERROR: Borrow of moved value of 'lines'
   }

In the for loop, the ownership of each item in :code:`lines` is given to the
variable :code:`line`.
