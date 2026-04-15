<h1 align="center">
	OCaml Module 02
</h1>

*<p align="center">Lists, variant types, pattern matching, and type definitions</p>*

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
ex00 | `encode` — Run-length encode a list into (count, value) pairs. |
ex01 | `crossover` — Return elements shared between two lists. |
ex02 | `gray` — Generate n-bit Gray codes (binary sequences where each value differs from the next by a single bit). |
ex03 | `sequence` — Return the nth term of the "look-and-say sequence". |
ex04 | `generate_nucleotide` — Convert a character (A, T, C, G) into a DNA nucleotide, modeled with record and variant types. |
ex05 | `generate_helix` / `complementary_helix` — Build a random DNA helix and compute its complement. |
ex06 | `generate_rna` — Transcribe a DNA helix to an mRNA sequence. |
ex07 | `decode_rna` / `rna_to_aminoacid` — Translate mRNA triplets into a protein chain using the genetic code. |
ex08 | `life` — Simulate the full DNA-to-protein pipeline: validate, transcribe, find start codon, and translate. |
