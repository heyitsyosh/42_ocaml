let ft_print_comb2 () =
  let rec loop x y =
    if x > 98 then
      ()
    else if y > 99 then
      loop (x + 1) (x + 2)
    else (
      print_int (x / 10);
      print_int (x mod 10);
      print_char ' ';
      print_int (y / 10);
      print_int (y mod 10);
      if not (x == 98 && y == 99) then (
        print_char ',';
        print_char ' '
      );
      loop x (y + 1)
    )
  in
  loop 0 1;
  print_char '\n'

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37mft_print_comb2:\x1b[0m";
  ft_print_comb2 ()
