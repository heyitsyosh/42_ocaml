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

let nucleobase_to_string = function
  | A -> "A" | T -> "T" | C -> "C" | G -> "G" | U -> "U" | _ -> "_"

(* ────── helix ────── *)
type helix = nucleotide list

let generate_helix n =
  Random.self_init ();
  let bases = [|'A'; 'T'; 'C'; 'G'|] in
  let rec loop i =
    if i <= 0 then []
    else generate_nucleotide bases.(Random.int 4) :: loop (i - 1)
  in
  loop n

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

let rec generate_bases_triplets = function
  | first :: second :: third :: xs ->
    (first, second, third) :: generate_bases_triplets xs
  | _ -> []

(* ──── aminoacid ──── *)
type aminoacid =
| Ala (* Alanine *)
| Arg (* Arginine *)
| Asn (* Asparagine *)
| Asp (* Aspartique *)
| Cys (* Cysteine *)
| Gln (* Glutamine *)
| Glu (* Glutamique *)
| Gly (* Glycine *)
| His (* Histidine *)
| Ile (* Isoleucine *)
| Leu (* Leucine *)
| Lys (* Lysine *)
| Met (* Methionine *)
| Phe (* Phenylalanine *)
| Pro (* Proline *)
| Ser (* Serine *)
| Thr (* Threonine *)
| Trp (* Tryptophane *)
| Tyr (* Tyrosine *)
| Val (* Valine *)
| Stop

let aminoacid_to_string = function
| Ala -> "Ala"
| Arg -> "Arg"
| Asn -> "Asn"
| Asp -> "Asp"
| Cys -> "Cys"
| Gln -> "Gln"
| Glu -> "Glu"
| Gly -> "Gly"
| His -> "His"
| Ile -> "Ile"
| Leu -> "Leu"
| Lys -> "Lys"
| Met -> "Met"
| Phe -> "Phe"
| Pro -> "Pro"
| Ser -> "Ser"
| Thr -> "Thr"
| Trp -> "Trp"
| Tyr -> "Tyr"
| Val -> "Val"
| Stop -> "*"

let rna_to_aminoacid = function
| (G, C, A) | (G, C, C) | (G, C, G) | (G, C, U) -> Ala
| (A, G, A) | (A, G, G) | (C, G, A) | (C, G, C) | (C, G, G) | (C, G, U) -> Arg
| (A, A, C) | (A, A, U) -> Asn
| (G, A, C) | (G, A, U) -> Asp
| (U, G, C) | (U, G, U) -> Cys
| (C, A, A) | (C, A, G) -> Gln
| (G, A, A) | (G, A, G) -> Glu
| (G, G, A) | (G, G, C) | (G, G, G) | (G, G, U) -> Gly
| (C, A, C) | (C, A, U) -> His
| (A, U, A) | (A, U, C) | (A, U, U) -> Ile
| (C, U, A) | (C, U, C) | (C, U, G) | (C, U, U) | (U, U, A) | (U, U, G) -> Leu
| (A, A, A) | (A, A, G) -> Lys
| (A, U, G) -> Met
| (U, U, C) | (U, U, U) -> Phe
| (C, C, C) | (C, C, A) | (C, C, G) | (C, C, U) -> Pro
| (U, C, A) | (U, C, C) | (U, C, G) | (U, C, U) | (A, G, U) | (A, G, C) -> Ser
| (A, C, A) | (A, C, C) | (A, C, G) | (A, C, U) -> Thr
| (U, G, G) -> Trp
| (U, A, C) | (U, A, U) -> Tyr
| (G, U, A) | (G, U, C) | (G, U, G) | (G, U, U) -> Val
| _ -> Stop (* UAA, UAG, UGA *)

(* ───── protein ───── *)
type protein = aminoacid list

let rec decode_rna = function
  | [] -> []
  | x :: xs ->
    let current = rna_to_aminoacid x in
    if current = Stop then [current]
    else (current) :: decode_rna xs

let rec string_of_protein = function
  | [] -> ""
  | x :: [] -> aminoacid_to_string x
  | x :: xs -> (aminoacid_to_string x) ^ "-" ^ string_of_protein xs

(* ────── Tests ────── *)

let rec print_rna = function
  | [] -> ()
  | x :: xs ->
      Printf.printf "%s" (nucleobase_to_string x);
      print_rna xs

let rec print_triplets = function
  | [] -> ()
  | (a, b, c) :: xs ->
      Printf.printf "%s%s%s"
        (nucleobase_to_string a)
        (nucleobase_to_string b)
        (nucleobase_to_string c);
      if xs <> [] then Printf.printf " | ";
      print_triplets xs

let test_generate_bases_triplets rna =
  Printf.printf "rna → ";
  print_rna rna;
  Printf.printf " → ";
  print_triplets (generate_bases_triplets rna);
  print_newline ()

let test_decode_rna triplets =
  print_triplets triplets;
  Printf.printf " → %S\n" (string_of_protein (decode_rna triplets))

let test_string_of_protein protein =
  Printf.printf "protein → %S\n" (string_of_protein protein)

let () =
  print_endline "\x1b[4;37mAminoacid & protein functions:\x1b[0m";

  print_endline "\x1b[2mgenerate_bases_triplets:\x1b[0m";
  test_generate_bases_triplets [A; U; G; G; G; C];
  test_generate_bases_triplets [A; U; G; G; G; C; U];
  test_generate_bases_triplets [A; U];
  test_generate_bases_triplets [];

  print_endline "\x1b[2mdecode_rna:\x1b[0m";
  test_decode_rna [(A, U, G); (U, A, A)];
  test_decode_rna [(A, U, G); (G, G, C); (U, U, U); (U, A, G)];
  test_decode_rna [(U, A, A)];
  test_decode_rna [];

  print_endline "\x1b[2mstring_of_protein:\x1b[0m";
  test_string_of_protein [];
  test_string_of_protein [Met];
  test_string_of_protein [Met; Gly; Phe];
  test_string_of_protein [Met; Gly; Stop];
