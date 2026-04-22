<h1 align="center">
	OCaml Module 04
</h1>

*<p align="center">Imperative syntax: for/while loops, mutable references, and arrays</p>*

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
# run all
make run
# run exercise N (e.g. make run3)
make run<N>
# run exercise N with arguments (e.g. make run3 ARGS="jokes.txt")
make run<N> ARGS="…" 
```

## Overview of exercise objectives:
| # | Objective |
|:---:|:---|
ex00 | `micronap` — Sleep for n seconds. |
ex01 | `ft_ref` — Self-implemented reference type with return, get, set, and bind. |
ex02 | `jokes` — Print a random joke from a hardcoded array. |
ex03 | `jokes` — Read jokes from a file and print a randomly chosen one. |
ex04 | `sum` — Add two floating-point numbers. |
ex05 | `eu_dist` — Compute the Euclidean distance between two float arrays. |
ex06 | `examples_of_file` — Parse a CSV file into (float array, label) pairs. |
ex07 | `one_nn` — Classify a radar sample using the 1-nearest neighbor algorithm. |
ex08 | `k_nn` — Classify a radar sample using k-nearest neighbor with majority voting. |
