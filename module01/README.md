<h1 align="center">
	OCaml Module 01
</h1>

*<p align="center">Higher-order functions, mathematical recursion, and numerical sequences</p>*

## Set-up/Compilation

Requires OCaml `>= 4.08` with `ocamlopt` available.

```python
make        # compile all
make ex0<N> # compile one excercise
make clean  # delete .o
make fclean # delete .o and binaries
make re     # fclean + compile
```

Run binaries:
```python
make run    # run all
make run<N> # run exercise N (e.g. make run3)
```

## Overview of exercise objectives:
| # | Objective |
|:---:|:---|
ex00 | `repeat_x` — Return "x" repeated n times. |
ex01 | `repeat_string` — Repeat a string n times (defaults to "x"). |
ex02 | `ackermann` — Compute the Ackermann function. |
ex03 | `tak` — Compute the Tak function. |
ex04 | `fibonacci` — Return the nth Fibonacci number. |
ex05 | `hfs_m`, `hfs_f` — Compute the mutually recursive Hofstadter M and F sequences. |
ex06 | `iter` — Apply a function to a value n times. |
ex07 | `converges` — Check if repeatedly applying a function reaches a fixed point within n steps. |
ex08 | `ft_sum` — Compute the summation of expr(i) for i from start to last. |
ex09 | `leibniz_pi` — Count Leibniz series iterations needed to approximate π within a given delta. |
