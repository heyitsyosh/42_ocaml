open Ft_test_sign

let test n =
    Printf.printf "%d is " n;
    ft_test_sign n

let () =
  print_endline "\x1b[4;37mft_test_sign:\x1b[0m";
  test 42;
  test 0;
  test (-42)
