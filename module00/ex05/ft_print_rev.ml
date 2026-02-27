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

let () =
  print_endline "\x1b[4;37mft_string_rev:\x1b[0m";
  print_endline "Hello world !";
  ft_print_rev "Hello world !";
  print_endline "\"\"";
  ft_print_rev ""
