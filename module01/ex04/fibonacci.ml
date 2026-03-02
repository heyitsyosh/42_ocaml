let rec fibonacci n =
  if n < 0 then
    -1
  else
    let rec loop i a b =
      if i = n then
        a
      else
        loop (i + 1) b (a + b)
    in
    loop 0 0 1

(* ────── Tests ────── *)

let test n = 
  Printf.printf "%d → %d\n" n (fibonacci n)

let () =
  print_endline "\x1b[4;37mfibonacci:\x1b[0m";
  test (-42);
  test 1;
  test 3;
  test 6;
  test 7;
