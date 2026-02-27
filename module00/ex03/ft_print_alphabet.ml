let ft_print_alphabet () =
  let rec loop c =
    if c <= 'z' then (
      print_char c;
      loop (char_of_int (int_of_char c + 1))
    )
  in
  loop 'a';
  print_char '\n'

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37mft_alphabet:\x1b[0m";
  ft_print_alphabet ()
