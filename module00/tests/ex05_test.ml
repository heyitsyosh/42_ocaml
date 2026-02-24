open Ft_print_rev

let () =
  print_endline "\x1b[4;37mft_string_rev:\x1b[0m";
  print_endline "Hello world !";
  ft_print_rev "Hello world !";
  print_endline "\"\"";
  ft_print_rev ""
