<h1 align="center">
	OCaml Module 03
</h1>

*<p align="center">Modules, nested modules, and interface files</p>*

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
ex00 | `Suit` — A module representing the four card suits (Spade, Heart, Diamond, Club), with functions (`toString`, `toStringVerbose`) to convert each suit to its string representation. |
ex01 | `Value` — A module representing the card values from 2 to Ace, with `toString`, `next` and `previous` functions . |
ex02 | `Card` — A module representing a card, with comparison and other utility functions. |
ex03 | `Deck` — A module representing a 52-card deck, with a `drawCard` function that returns the top card and the remaining deck. Includes a `.mli` file that defines the public interface. |
