let eu_dist a b =
  try
    let acc = ref 0.0 in
    Array.iter2 (fun x y -> acc := !acc +. (x -. y) ** 2.0) a b;
    sqrt !acc
  with _ -> prerr_endline "Error: input arrays have different lengths"; 0.0

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
