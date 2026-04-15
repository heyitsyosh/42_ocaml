<h1 align="center">
	OCaml Module 05
</h1>

*<p align="center">Functors — parameterized modules and module-level abstraction</p>*

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
ex00 | Use `Set.Make` to create a sorted string set. |
ex01 | Use `Hashtbl.Make` with a custom string module providing `equal` and `hash`. |
ex02 | `MakeFst` / `MakeSnd` — Functors that extract the first or second element of a pair. |
ex03 | `Make` — Functor that builds a fixed-point arithmetic module from a fractional bits parameter. |
ex04 | `MakeEvalExpr` — Functor that builds an expression evaluator, instantiated for int, float, and string. |
