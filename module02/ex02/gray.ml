let to_bits n width =
  let rec loop i acc =
    if i = width then acc
    else loop (i + 1) (((n lsr i) land 1) :: acc)
  in
  loop 0 []

let rec print_bits = function
| [] -> ()
| bit :: bits ->
  print_int bit;
  print_bits bits

let gray n =
  let total = 1 lsl n in
  let rec loop i =
    if i < total then (
      let code = i lxor (i lsr 1) in
      print_bits (to_bits code n);
      if i < total - 1 then print_string ", ";
      loop (i + 1)
    )
  in
  loop 0;
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
