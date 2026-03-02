let rec hfs_m n =
  if n < 0 then
    -1
  else if n = 0 then
    0
  else
    (n - hfs_f (hfs_m (n - 1)))
and hfs_f n =
  if n < 0 then
    -1
  else if n = 0 then
    1
  else
    (n - hfs_m (hfs_f (n - 1)))

(* ────── Tests ────── *)

let test_m n =
  Printf.printf "%2d → %2d\n" n (hfs_m n)

let test_f n =
  Printf.printf "%2d → %2d\n" n (hfs_f n)

let () =
  print_endline "\x1b[4;37mHofstadter:\x1b[0m";
  print_endline "[Male sequence]";
  test_m (-5);
  test_m 0;
  test_m 4;
  test_m 10;
  print_endline "[Female sequence]";
  test_f (-5);
  test_f 0;
  test_f 4;
  test_f 10
