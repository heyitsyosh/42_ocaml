let to_bits n width =
  let rec loop i acc =
    if i < 0 then acc
    else loop (i - 1) (((n lsr i) land 1) :: acc)
  in
  loop (width - 1) []

let rec print_bits = function
  | [] -> ()
  | bit :: bits ->
    print_int bit;
    print_bits bits

let prefix bit bits = bit :: bits

let mirror lst =
  let rec loop acc = function
    | [] -> acc
    | x :: xs -> loop (x :: acc) xs
  in
  loop [] lst

let rec map f = function
  | [] -> []
  | x :: xs -> f x :: map f xs

let gray n =
  let rec build depth =
    if depth = 1 then [[0]; [1]]
    else
      let prev = build (depth - 1) in
      let first_half = map (prefix 0) prev in
      let second_half = map (prefix 1) (mirror prev) in
      first_half @ second_half
  in
  let sequence = build n in
  let rec print_seq i = function
    | [] -> ()
    | bits :: rest ->
      print_bits bits;
      if rest <> [] then print_string ", ";
      print_seq (i + 1) rest
  in
  print_seq 0 sequence;
  print_newline ()

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37mgray:\x1b[0m";
  let n = 4 in
  let rec loop i =
    if (i <= n) then (
      Printf.printf "%2d → " i;
      gray i;
      loop (i + 1)
    )
  in loop (-1)
