let converges f x n =
  let rec loop i acc =
    if i = acc then
      true
    else if i = n then
      false
    else
      loop (i + 1) (f acc)
  in loop 0 x

(* ────── Tests ────── *)

let bool_as_string = function
  | true -> "true"
  | false -> "false"

let test label f x n =
  Printf.printf "%-7s  x=%3d   n=%3d  → %s\n"
    label x n (bool_as_string (converges f x n))

let () =
  print_endline "\x1b[4;37mconverges:\x1b[0m";
  test "x * 2" (( * ) 2) 2 5;
  test "x / 2" (fun x -> x / 2) 2 3;
  test "x / 2" (fun x -> x / 2) 2 2;
  test "x + 1" (fun x -> x + 1) 0 10;
  test "abs(x)" (fun x -> if x < 0 then -x else x) (-5) 1;
