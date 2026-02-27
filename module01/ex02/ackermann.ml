let rec ackermann m n =
  if m < 0 || n < 0 then
    -1
  else if m = 0 then
    n + 1
  else if n = 0 then
    ackermann (m - 1) 1
  else
    ackermann (m - 1) (ackermann m (n - 1))

(* ────── Tests ────── *)

let test m n =
  Printf.printf "m = %2d, n = %d → %d\n" m n (ackermann m n)

let () =
  print_endline "\x1b[4;37mackermann tests:\x1b[0m";
  test (-1) 7;
  test 0 0;
  test 2 3;
  test 4 1; (* 65533 *)
  test 4 0
