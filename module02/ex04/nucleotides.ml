type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None

type nucleotide = {
  phosphate: phosphate;
  sugar: deoxyribose;
  base: nucleobase;
}

let generate_nucleotide c =
  let base =
    match c with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _ -> None
  in
  {
    phosphate = "phosphate";
    sugar = "deoxyribose";
    base = base;
  }

(* ────── Tests ────── *)

let test c =
  let n = generate_nucleotide c in
  let base = match n.base with
    | A -> "A"
    | T -> "T"
    | C -> "C"
    | G -> "G"
    | None -> "None"
  in
  Printf.printf "%c → %s\n" c base

let () =
  print_endline "\x1b[4;37mNucleotide functions:\x1b[0m";
  test 'A';
  test 'T';
  test 'a'
