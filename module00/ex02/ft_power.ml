let rec ft_power n power =
  if power = 0 then
    1
  else
    n * (ft_power n (power - 1))

(* ────── Tests ────── *)

let test x y =
  Printf.printf "%d ^ %d = %d\n" x y (ft_power x y)

let () =
  print_endline "\x1b[4;37mft_power:\x1b[0m";
  test 2 4;
  test 3 0;
  test 0 5
