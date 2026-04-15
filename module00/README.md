<h1 align="center">
	OCaml Module 00
</h1>

*<p align="center">Basic OCaml syntax, recursion, and string manipulation</p>*

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
| # | Objective |
|:---:|:---|
ex00 | `ft_test_sign` — Print whether an integer is positive or negative. |
ex01 | `ft_countdown` — Recursively count down from n to 0. |
ex02 | `ft_power` — Compute n raised to a integer power. |
ex03 | `ft_print_alphabet` — Print the alphabet . |
ex04 | `ft_print_comb` — Print all unique ordered combinations of three different digits. |
ex05 | `ft_print_rev` — Print a string in reverse. |
ex06 | `ft_string_all` — Return whether all characters in a string satisfy a function. |
ex07 | `ft_is_palindrome` — Check if a string reads the same forwards and backwards. |
ex08 | `ft_rot_n` — Apply a Caesar-style rotation of n to all alphabetic characters in a string. |
ex09 | `ft_print_comb2` — Print all unique ordered pairs of two-digit numbers (`00`–`99`). |
