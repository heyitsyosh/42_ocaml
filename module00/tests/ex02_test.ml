open Ft_power

let test x y =
  Printf.printf "%d ^ %d = %d\n" x y (ft_power x y)

let () =
  print_endline "\x1b[4;37mft_power:\x1b[0m";
  test 2 4;
  test 3 0;
  test 0 5
