let ft_print_rev str =
  let rec loop i =
    if i >= 0 then (
      print_char (String.get str i);
      loop (i - 1)
    )
  in
  loop (String.length str - 1);
  print_char '\n'

(* ────── Tests ────── *)

let test str =
  Printf.printf "%S → " str;
  ft_print_rev str

let () =
  print_endline "\x1b[4;37mft_string_rev:\x1b[0m";
  test "Hello world !";
  test ":)";
  test ""
