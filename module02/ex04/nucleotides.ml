type phosphate = string

type deoxyribose = string

type nucleobase =
  | A
  | T
  | C
  | G
  | None

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
  match n.base with
  | A -> Printf.printf "%c -> A\n" c
  | T -> Printf.printf "%c -> T\n" c
  | C -> Printf.printf "%c -> C\n" c
  | G -> Printf.printf "%c -> G\n" c
  | None -> Printf.printf "%c -> None\n" c

let () =
  print_endline "\x1b[4;37mgenerate_nucleotide:\x1b[0m";
  test 'A';
  test 'T';
  test 'a'
