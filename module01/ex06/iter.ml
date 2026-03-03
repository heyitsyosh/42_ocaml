let iter f x n =
  if n < 0 then
    -1
  else
    let rec loop i acc =
      if i = n then
        acc
      else
        loop (i + 1) (f acc)
    in loop 0 x

(* ────── Tests ────── *)

let test label f x n =
  Printf.printf "%-7s  x=%3d   n=%3d  → %d\n" label x n (iter f x n)

let () =
  print_endline "\x1b[4;37miter:\x1b[0m";
  print_endline "iter(f, x, n) = fⁿ(x)";
  test "x * 2" (fun x -> x * 2) 2 (-1);
  test "x * 2" (fun x -> x * 2) 2 0;
  test "x * 2" (fun x -> x * 2) 2 4;
  test "x + 1" (fun x -> x + 1) 0 10;
  test "x * x" (fun x -> x * x) 2 4;
  test "x * x" (fun x -> x * x) 3 2;
  test "x * 2" (fun x -> x * 2) (-3) 3;
  test "abs(x)" (fun x -> if x < 0 then -x else x) (-5) 1;
