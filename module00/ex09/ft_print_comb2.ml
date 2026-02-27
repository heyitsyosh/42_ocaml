let ft_print_comb2 () =
  let rec first_num x =
    if x > 98 then
      ()
    else
      let rec second_num y =
        if y > 99 then
          first_num (x + 1)
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
          second_num (y + 1)
        )
      in
      second_num (x + 1)
  in
  first_num 0;
  print_char '\n'

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37mft_print_comb2:\x1b[0m";
  ft_print_comb2 ()
