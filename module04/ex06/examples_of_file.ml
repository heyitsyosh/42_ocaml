let rec split_last l =
  let len = List.length l in
  assert (len > 0);
  let float_list = Array.make (len - 1) 0.0 in
  let last = ref "" in
  List.iteri (fun i x ->
    if i < (len - 1) then float_list.(i) <- float_of_string x
    else last := x
  ) l;
  (float_list, last)

let read_file ic =
  let lines = ref [] in
  (try
    while true do
      let line = input_line ic in
      lines := split_last (String.split_on_char ',' line) :: !lines
    done
  with End_of_file -> ());
  List.rev(!lines)

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
  Printf.printf "  ([|%s|], \"%s\")\n" floats_str !label

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
  (* test "ex06/ionosphere.test.csv"; *)
  test ~cap:2 "ex06/ionosphere.test.csv";
  test ~cap:2 "ex06/ionosphere.train.csv";
  test "ex06/simple.csv";
  test "ex06/invalid.train.csv"
