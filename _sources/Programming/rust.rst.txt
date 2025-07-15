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

