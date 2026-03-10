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

let rec helix_to_string = function
  | [] -> ""
  | x :: xs ->
    let base =
      match x.base with
      | A -> "A"
      | T -> "T"
      | C -> "C"
      | G -> "G"
      | _ -> "_"
    in
    base ^ helix_to_string xs

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

(* ────── Tests ────── *)

let test len =
  let h = generate_helix len in
  let comp = complementary_helix h in
  Printf.printf "[len=%d]\n" len;
  Printf.printf "helix          → %S\n" (helix_to_string h);
  Printf.printf "complementary  → %S\n" (helix_to_string comp)

let () =
  print_endline "\x1b[4;37mHelix functions:\x1b[0m";
  test 10;
  test 5;
  test 0;
  test (-1)
