let sum x y =
  x +. y

(* ────── Tests ────── *)

let test_g x y =
  Printf.printf "%g + %g = %g\n" x y (sum x y)

let test_f x y =
  Printf.printf "%f + %f = %.17f\n" x y (sum x y)

let () =
  print_endline "\x1b[4;37msum:\x1b[0m";
  test_g 0.0 0.0;
  test_g (-14.597) 56.597;
  test_g 23.23 18.77;
  test_g Float.pi Float.zero;
  test_g nan 1.0;
  test_g neg_infinity infinity;
  test_f 0.1 0.2;
  test_f Float.epsilon Float.one;
