let leibniz_pi delta =
	if delta < 0.0 then
		-1
	else
		let pi = 4.0 *. atan 1.0 in
		let rec loop i sum =
			let term = (if i mod 2 = 0 then 1.0 else -1.0) /. float_of_int (2 * i + 1)in
				if (pi -. (4.0 *. (sum +. term))) <= delta 
					&& (4.0 *. (sum +. term) -. pi) <= delta then
					i
				else
					loop (i + 1) (sum +. term)
		in
		loop 0 0.0

(* ────── Tests ────── *)

let test delta =
	Printf.printf "%2d iteration(s) to reach delta smaller than %g\n"
	(leibniz_pi delta) delta

let () =
  print_endline "\x1b[4;37mleibniz_pi:\x1b[0m";
  test (-42.0);
  test 1.0;
  test 0.5;
  test 0.1;
  test 0.01;
