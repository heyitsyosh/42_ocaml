let eu_dist a b =
  let len = Array.length a in
  if len <> Array.length b then
    exit 0;
  let rec loop i acc =
    if i < len then
      loop (i + 1) (acc +. ((a.(i) -. b.(i)) ** 2.0))
    else
      sqrt acc
  in
  loop 0 0.0

(* ────── Tests ────── *)

let test a b =
  let fmt_arr arr =
    "[" ^ String.concat ", " (Array.to_list (Array.map string_of_float arr)) ^ "]"
  in
  Printf.printf "Euclidian distance between %12s %12s = %G\n"
  (fmt_arr a) (fmt_arr b) (eu_dist a b)

let () =
  print_endline "\x1b[4;37meu_dist:\x1b[0m";
  test [|1.0|] [|4.0|];
  test [|0.0; 0.0|] [|3.0; 4.0|];
  test [|0.0; 0.0|] [|0.0; 0.0|];
  test [|0.0; 0.0|] [|-3.0; -4.0|];
  test [|0.0; 0.0; 0.0|] [|1.0; 1.0; 1.0|]
