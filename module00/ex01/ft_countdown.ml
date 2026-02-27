let rec ft_countdown x =
  let n = if x < 0 then 0 else x in
  print_int n;
  print_char '\n';
  if n > 0 then
    ft_countdown (n - 1)

(* ────── Tests ────── *)

let test n =
  Printf.printf "Counting down from %d:\n" n;
  ft_countdown n

let () =
  print_endline "\x1b[4;37mft_countdown:\x1b[0m";
  test 3;
  test 0;
  test (-3)
