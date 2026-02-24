open Ft_countdown

let () =
  print_endline "\x1b[4;37mft_countdown:\x1b[0m";
  print_endline "Counting down from 3:";
  ft_countdown 3;
  print_endline "Counting down from 0:";
  ft_countdown 0;
  print_endline "Counting down from -3:";
  ft_countdown (-3)
