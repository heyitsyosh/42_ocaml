open Ft_rot_n

let () =
  print_endline "\x1b[4;37mft_rot_n:\x1b[0m";
  let test n str =
    Printf.printf "%3d \"%s\" → \"%s\"\n"
      n str (ft_rot_n n str)
  in
  test 1  "abcdefghijklmnopqrstuvwxyz";
  test 13 "abcdefghijklmnopqrstuvwxyz";
  test 26 "abcdefghijklmnopqrstuvwxyz";
  test 42 "0123456789";
  test 2  "OI2EAS67B9";
  test 0  "Damned !";
  test 42 "";
  test 1  "NBzlk qnbjr !"
