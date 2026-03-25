let split_last l =
  match List.rev l with
  | [] -> assert false
  | [x] -> ([||], x)
  | last :: rest ->
    (Array.of_list (List.map float_of_string (List.rev rest)), last)

let read_file ic =
  let rec loop acc =
    match input_line ic with
    | line -> loop (split_last (String.split_on_char ',' line) :: acc)
    | exception End_of_file -> List.rev acc
  in loop []

let examples_of_file path =
  try
    let ic = open_in path in
    let lines = read_file ic in
    close_in ic;
    lines
  with _ -> prerr_endline ("Error: unable to open '" ^ path ^ "'"); []

(* ────── Tests ────── *)

let print_entry (floats, label) =
  let floats_str = String.concat ", " (Array.to_list (Array.map string_of_float floats)) in
  Printf.printf "  ([|%s|], \"%s\")\n" floats_str label

let test ?(cap = -1) path =
  let data = examples_of_file path in
  let n = List.length data in
  Printf.printf "\x1b[33minput = \"%s\" (%d lines)\x1b[0m\n" path n;
  match data with
  | [] -> print_endline "  (empty)"
  | _ ->
    let shown = if cap < 0 then n else min cap n in
    List.iteri (fun i entry ->
      if i < shown then print_entry entry
    ) data;
    if shown < n then Printf.printf "  ... (%d more)\n" (n - shown)

let () =
  print_endline "\x1b[4;37mexamples_of_file:\x1b[0m";
  (* test "datasets/ionosphere.test.csv"; *)
  test ~cap:2 "datasets/ionosphere.test.csv";
  test ~cap:2 "datasets/ionosphere.train.csv";
  test "datasets/simple.csv";
  test "datasets/invalid.train.csv"
