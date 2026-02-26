open Repeat_x

let test n =
  Printf.printf "%3d → %s\n" n (repeat_x n)

let () =
  print_endline "\x1b[4;37mrepeat_x:\x1b[0m";
  test (-1);
  test 0;
  test 1;
  test 2;
  test 5
