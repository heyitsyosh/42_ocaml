let ft_print_comb () =
  let rec first_digit x =
    if x > 7 then
			()
		else
			let rec second_digit y =
				if y > 8 then
					first_digit(x + 1)
				else
					let rec third_digit z =
						if z > 9 then
							second_digit (y + 1)
						else (
							print_int x;
							print_int y;
							print_int z;
							if not (x = 7 && y = 8 && z = 9) then print_string ", ";
							third_digit(z + 1)
						)
					in
					third_digit (y + 1)
			in
			second_digit (x + 1)
  in
	first_digit (0);
	print_string "\n"

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37mft_print_comb:\x1b[0m";
  ft_print_comb ()
