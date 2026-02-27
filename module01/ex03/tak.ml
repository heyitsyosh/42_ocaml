let rec tak x y z =
  if y < x then
    (tak (tak (x - 1) y z)) (tak (y - 1) z x) (tak (z - 1) x y)
  else
    z

(* ────── Tests ────── *)

let test x y z =
  Printf.printf "tak(%2d, %2d, %2d) = %d\n" x y z (tak x y z)

let () =
  print_endline "\x1b[4;37mtak:\x1b[0m";
  test 1 2 3;
  test 5 23 7;
  test 9 1 0;
  test 1 1 1;
  test 0 42 0;
  test 23498 98734 98776 (* 98776 *)
