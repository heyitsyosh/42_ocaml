let ft_print_comb () =
  let rec loop x y z=
    if x > 7 then
			()
		else if y > 8 then
      loop (x + 1) (x + 2) (x + 3)
    else if z > 9 then
      loop x (y + 1) (y + 2)
    else (
			print_int x;
			print_int y;
			print_int z;
			if not (x = 7 && y = 8 && z = 9) then print_string ", ";
			loop x y (z + 1)
		)
  in
	loop 0 1 2;
	print_string "\n"

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37mft_print_comb:\x1b[0m";
  ft_print_comb ()
