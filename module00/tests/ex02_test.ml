open Ft_power

let () =
  print_endline "\x1b[4;37mft_power:\x1b[0m";
  print_string "2 ^ 4 = ";
  print_int(ft_power 2 4);
  print_newline ();
  print_string "3 ^ 0 = ";
  print_int(ft_power 3 0);
  print_newline ();
  print_string "0 ^ 5 = ";
  print_int(ft_power 0 5);
  print_endline "";
