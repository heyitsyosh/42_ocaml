type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | U | None

(* ──── nucleotide ─── *)
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

(* ────── helix ────── *)
type helix = nucleotide list

let generate_helix n =
  Random.self_init ();
  let bases = [|'A'; 'T'; 'C'; 'G'|] in
  let rec loop i =
    if i <= 0 then
      []
    else
      generate_nucleotide bases.(Random.int 4) :: loop (i - 1)
  in
  loop n

let nucleobase_to_string = function
| A -> "A"
| T -> "T"
| C -> "C"
| G -> "G"
| U -> "U"
| _ -> "_"

let rec helix_to_string = function
| [] -> ""
| x :: xs -> nucleobase_to_string x.base ^ helix_to_string xs

let rec complementary_helix = function
| [] -> []
| x :: xs ->
  (match x.base with
  | A -> generate_nucleotide 'T'
  | T -> generate_nucleotide 'A'
  | C -> generate_nucleotide 'G'
  | G -> generate_nucleotide 'C'
  | _ -> generate_nucleotide '_'
  ) :: complementary_helix xs

(* ────── mRNA ─────── *)
type rna = nucleobase list

let rec generate_rna = function
| [] -> []
| x :: xs ->
  (match x.base with
  | A -> U
  | T -> A
  | C -> G
  | G -> C
  | _ -> None
  ) :: generate_rna xs

(* ────── Tests ────── *)

let rec rna_to_string = function
| [] -> ""
| x :: xs -> nucleobase_to_string x ^ rna_to_string xs

let test n =
  Printf.printf "[len=%d]\n" n;
  let h = generate_helix n in
  let r = generate_rna h in
  Printf.printf "DNA -> %S\n" (helix_to_string h);
  Printf.printf "RNA -> %S\n" (rna_to_string r)

let () =
  print_endline "\x1b[4;37mRNA functions:\x1b[0m";
  test 10;
  test 5;
  test 0;
  test (-1)
