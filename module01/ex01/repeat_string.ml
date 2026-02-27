let rec repeat_string ?str:(str="x") n =
  if n < 0 then
    "Error"
  else if n = 0 then
    ""
  else
    str ^ repeat_string ~str (n - 1)

(* ────── Tests ────── *)

let test n =
  Printf.printf "%3d → \"%s\"\n" n (repeat_string n)

let test_with_str str n =
  Printf.printf "%3d * \"%s\" → \"%s\"\n" n str (repeat_string ~str n)

let () =
  print_endline "\x1b[4;37mrepeat_string:\x1b[0m";
  print_endline "[Default string]";
  test (-1);
  test 0;
  test 1;
  test 2;
  test 5;
  print_endline "[Custom string]";
  test_with_str "Toto" 1;
  test_with_str "a" 5;
  test_with_str "what" 3;
  test_with_str "abc" 4;
  test_with_str "" 4
