let ft_string_all func str =
  let rec loop i =
    if i < 0 then
      true
    else if not (func (String.get str i)) then
      false
    else
      loop (i - 1)
  in
  loop (String.length str - 1)

(* ────── Tests ────── *)

let bool_as_string = function
  | true -> "true"
  | false -> "false"

let is_digit c = c >= '0' && c <= '9'

let test str =
  Printf.printf "%s -> %s\n"
    (if str = "" then "\"\"" else str)
    (bool_as_string (ft_string_all is_digit str))

let () =
  print_endline "\x1b[4;37mft_string_all:\x1b[0m";
  test "0123456789";
  test "0123456789a";
  test ""
