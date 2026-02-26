open Ft_is_palindrome

let bool_as_string = function
  | true -> "true"
  | false -> "false"

let test str =
  Printf.printf "%s -> %s\n"
    (if str = "" then "\"\"" else str)
    (bool_as_string(ft_is_palindrome str))

let () =
  print_endline "\x1b[4;37mft_is_palindrome:\x1b[0m";
  test "4";
  test "42";
  test "424";
  test "4224";
  test "42224";
  test "422244";
  test "";
