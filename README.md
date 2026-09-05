# dr_quine

> A 42 school project where we explore self-reproducing programs (quines)
> in both **C** and **x86-64 Assembly**, discovering Kleene's recursion
> theorem along the way.

## 📖 Overview
This project is about confronting the principle of self-reproduction: a
quine is a program whose output is identical to its own source code, with
no cheating allowed (no reading the source file, no data entry). We build
three programs of increasing complexity, each implemented twice — once in
C and once in Assembly — that explore different facets of self-reproduction,
from a simple quine to a self-compiling, self-decrementing chain of
programs. As a bonus, the whole project was also redone in **Python** and
**Rust**.

## 🎯 Objectives
-   Understand and implement the concept of a **quine**
-   Discover **Kleene's recursion theorem** and the notion of **fixed points**
-   Implement every mandatory program in **both C and x86-64 Assembly**
    -   **Colleen**: write a program that prints its own source code to
standard output
    -   **Grace**: write a program, with no declared functions and driven
entirely through macros, that writes its own source code to a file
    -   **Sully**: write a program that generates, compiles and executes a
new version of itself, decrementing an internal counter each time,
until it stops at 0
-   Handle errors carefully so the program never crashes or misbehaves
unexpectedly (segfault, double free, etc.)
-   **Bonus**: redo the entire project (Colleen, Grace and Sully) in one
additional language, (but I did two for fun) **Python** and **Rust**, adapting
the macro-based constraints where the language doesn't support `#define`-style
macros

## 📚 Lexicon
-   **Quine**: A computer program whose output, when executed, is
identical to its own source code.
-   **Kleene's recursion theorem**: A result in computability theory
showing that a program can obtain and act upon its own source code /
description, which underlies the existence of quines.
-   **Fixed point**: Construct that "produces itself," conceptually mirroring
how a quine reproduces its own source.
-   **Macro**: A preprocessor directive that expands into a block of code.
-   **Entry point**: The first instruction executed when a program runs,
typically `_start` in raw assembly, as opposed to `main` in C.
-   **nasm**: The assembler used to compile `.s` assembly source files into
object code on x86-64 Linux.
