open Ft_test_sign

let () =
  print_endline "\x1b[4;37mft_test_sign:\x1b[0m";
  print_string "42 is ";
  ft_test_sign 42;
  print_string "0 is ";
  ft_test_sign 0;
  print_string "-42 is ";
  ft_test_sign (-42)
