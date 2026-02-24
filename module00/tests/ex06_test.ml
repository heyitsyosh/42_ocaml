open Ft_string_all

let is_digit c = c >= '0' && c <= '9'

let bool_as_string = function
  | true -> "true"
  | false -> "false"

let () =
  print_endline "\x1b[4;37mft_string_all:\x1b[0m";
  print_string "0123456789 -> ";
  print_endline (bool_as_string(ft_string_all is_digit "0123456789"));
  print_string "0123456789a -> ";
  print_endline (bool_as_string(ft_string_all is_digit "0123456789a"));
  print_string "\"\" -> ";
  print_endline (bool_as_string(ft_string_all is_digit ""))
