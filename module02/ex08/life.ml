type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | U | None

let nucleobase_to_string = function
| A -> "A" | T -> "T" | C -> "C" | G -> "G" | U -> "U" | _ -> "_"

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
    if i <= 0 then []
    else generate_nucleotide bases.(Random.int 4) :: loop (i - 1)
  in
  loop n

let rec helix_to_string = function
| [] -> ""
| x :: xs -> nucleobase_to_string x.base ^ helix_to_string xs

let string_to_helix s =
  let len = String.length s in
  let rec loop i acc =
    if i = len then
      List.rev acc
    else
      loop (i + 1) (generate_nucleotide s.[i] :: acc)
  in
  loop 0 []

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

let rec rna_to_string = function
| [] -> ""
| x :: xs -> nucleobase_to_string x ^ rna_to_string xs

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
| _ -> Stop

(* ───── protein ───── *)
type protein = aminoacid list

let rec decode_rna = function
| [] -> []
| x :: xs ->
  let current = rna_to_aminoacid x in
  if current = Stop then [current]
  else current :: decode_rna xs

let rec protein_to_string = function
| [] -> ""
| x :: [] -> aminoacid_to_string x
| x :: xs -> aminoacid_to_string x ^ "-" ^ protein_to_string xs

(* ───── Protein synthesis simulator functions ───── *)

let transcribe_helix_to_rna coding_strand =
  print_endline "Step 1 - Transcription";
  let comp_strand = complementary_helix coding_strand in
  let rna = generate_rna comp_strand in
  print_endline (" Coding strand   :" ^ helix_to_string coding_strand);
  print_endline (" Template strand :" ^ helix_to_string comp_strand);
  print_endline (" Transcribed RNA :" ^ rna_to_string rna);
  rna

let rec print_triplets = function
| [] -> ()
| (a, b, c) :: xs ->
  print_string (
    nucleobase_to_string a ^
    nucleobase_to_string b ^
    nucleobase_to_string c
  );
  if xs <> [] then print_string "-";
  print_triplets xs

let rec find_start = function
| A :: U :: G :: xs -> A :: U :: G :: xs
| _ :: xs -> find_start xs
| [] -> []

let translate_rna_to_protein rna =
  print_endline "Step 2 - Translation";
  print_endline "Finding start codon...";
  let start = find_start rna in
  if start = [] then (
    print_endline "\x1b[31mError: No start codon found\x1b[0m";
    []
  )
  else (
    print_endline (" mRNA from start :" ^ rna_to_string start);
    let triplets = generate_bases_triplets start in
      print_string " Triplets        :";
      print_triplets triplets;
      print_newline ();
    let protein = decode_rna triplets in
      print_endline (" Protein         :" ^ protein_to_string protein);
      protein
  )

let rec has_invalid_base = function
| [] -> false
| x :: xs ->
  if x.base = None then true
  else has_invalid_base xs

let life dna =
  let coding_strand = string_to_helix dna in
  if String.length (helix_to_string coding_strand) < 3 then (
    print_endline
      ("\x1b[31mError: DNA sequence found in \"" ^ dna ^
      "\" is too short...\x1b[0m");
    []
  )
  else if has_invalid_base coding_strand then (
    print_endline
      ("\x1b[31mError: DNA sequence found in \"" ^ dna ^
       "\" contains invalid nucleobases...\x1b[0m");
    []
  )
  else (
    let rna = transcribe_helix_to_rna coding_strand in
    translate_rna_to_protein rna
  )

(* ────── Tests ────── *)

let test s =
  Printf.printf "─── Testing \"%s\" ───\n" s;
 let result = life s in
  Printf.printf "\x1b[32mResult: %s\n\n\x1b[0m"
  (if result <> [] then protein_to_string result else "[]")

let () =
  print_endline "\x1b[4;37mlife:\x1b[0m";

  (* Error cases *)
  test "";
  test "GA";
  test "GAG";
  test "ATGGUCG CTGA"; (* Met-Gly-Pro-*, collagen? *)
  test "TGA"; (* No start codon *)

  (* Regular cases *)
  (* Start codon (Methionine): ATG → TAC → AUG
     End codon UGA (also UAA, UAG):  TGA → ACT → UGA *)
  test "ATGAAA"; (* No end codon *)
  test "ATGGGTCCATGA"; (* Met-Gly-Pro-*, collagen? *)
  test "AAAATGGGTCCATGA"; (* Met-Gly-Pro-*, ignore front *)
  test "ATGGGTCCATGAAAA"; (* Met-Gly-Pro-*, ignore back *)
