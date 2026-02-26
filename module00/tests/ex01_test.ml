open Ft_countdown

let test n =
  Printf.printf "Counting down from %d:\n" n;
  ft_countdown n

let () =
  print_endline "\x1b[4;37mft_countdown:\x1b[0m";
  test 3;
  test 0;
  test (-3)
