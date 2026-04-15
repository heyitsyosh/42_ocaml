<h1 align="center">
	OCaml Module 06
</h1>

*<p align="center">Object-oriented programming with classes, parametric classes, and explicit type constraints</p>*

## Set-up/Compilation

Requires OCaml `>= 4.08` with `ocamlopt` available.

```bash
make        # compile all
make ex0<N> # compile one excercise
make clean  # delete .o
make fclean # delete .o and binaries
make re     # fclean + compile
```

Run binaries:
```bash
make run    # run all
make run<N> # run exercise N (e.g. make run3)
```

## Overview of exercise objectives:
This module introduces class construction syntax using a Doctor Who theme.
| # | Objective |
|:---:|:---|
ex00 | `people` — Define a class with immutable and mutable instance variables, methods, and an initializer. |
ex01 | `doctor` — Use labeled arguments (~age, ~sidekick), mutate fields (`<-`), and implement a private method. |
ex02 | `dalek` — Use an initializer for random name generation and perform cross-class method calls. |
ex03 | `army` — Implement a parametric class that can store elements of any type. |
ex04 | `gallifrey` — Define methods with explicit polymorphism and structural type constraints. |
