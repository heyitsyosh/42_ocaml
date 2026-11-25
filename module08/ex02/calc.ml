module type MONOID = sig
  type element
  val zero1 : element
  val zero2 : element
  val mul : element -> element -> element
  val add : element -> element -> element
  val div : element -> element -> element
  val sub : element -> element -> element
end

module INT : MONOID with type element = int = struct
  type element = int
  let zero1 : element = 0
  let zero2 : element = 1
  let mul (x : element) (y : element) : element = x * y
  let add (x : element) (y : element) : element = x + y
  let div (x : element) (y : element) : element = x / y
  let sub (x : element) (y : element) : element = x - y
end

module FLOAT : MONOID with type element = float = struct
  type element = float
  let zero1 : element = 0.0
  let zero2 : element = 1.0
  let mul (x : element) (y : element) : element = x *. y
  let add (x : element) (y : element) : element = x +. y
  let div (x : element) (y : element) : element = x /. y
  let sub (x : element) (y : element) : element = x -. y
end

(* ───── Functor ───── *)

module Calc : functor (M : MONOID) -> sig
  val add : M.element -> M.element -> M.element
  val sub : M.element -> M.element -> M.element
  val mul : M.element -> M.element -> M.element
  val div : M.element -> M.element -> M.element
  val power : M.element -> int -> M.element
  val fact : M.element -> M.element
end = functor (M : MONOID) -> struct
  let add x y = M.add x y
  let sub x y = M.sub x y
  let mul x y = M.mul x y
  let div x y = M.div x y

  let power base exponent =
    if exponent < 1 then invalid_arg "power: Expected a positive exponent"
    else
      let rec loop acc i =
        if i < exponent then loop M.(mul acc base) (i + 1)
        else acc
      in loop base 1

  let rec fact n =
    if n < M.zero1 then invalid_arg "fact: Expected non-negative input"
    else if n < M.zero2 then M.zero2
    else M.mul n @@ fact @@ M.sub n M.zero2
end

(* ────── Tests ────── *)

module Calc_int = Calc(INT)
module Calc_float = Calc(FLOAT)

let exception_to_string = function
  | Invalid_argument msg -> "Invalid_argument(\"" ^ msg ^ "\")"
  | Division_by_zero -> "Division_by_zero"
  | Failure msg -> "Failure(\"" ^ msg ^ "\")"
  | _ -> "unknown exception"

let safe_run label f =
  let result = try f () with e -> exception_to_string e in
  print_endline (label ^ " = " ^ result)

let i label f = safe_run label (fun () -> string_of_int (f ()))
let fl label f = safe_run label (fun () -> string_of_float (f ()))

let () =
  print_endline "\x1b[4;37mCalc:\x1b[0m";
  print_endline "\x1b[90mInt - add, sub, div, mul\x1b[0m";
  i "add 1 2"      (fun () -> Calc_int.add 1 2);
  i "sub 5 8"      (fun () -> Calc_int.sub 5 8);
  i "mul -6 -7"		 (fun () -> Calc_int.mul (-6) (-7));
  i "div 7 2"      (fun () -> Calc_int.div 7 2);
  i "div 1 0"      (fun () -> Calc_int.div 1 0);
  i "add 0 zero1"  (fun () -> Calc_int.add 0 INT.zero1);
  i "mul 42 zero2" (fun () -> Calc_int.mul 42 INT.zero2);

  print_endline "\n\x1b[90mInt - power, factorial\x1b[0m";
  i "power 2 0"  (fun () -> Calc_int.power 2 0);
  i "power 3 1"  (fun () -> Calc_int.power 3 1);
  i "power 3 3"  (fun () -> Calc_int.power 3 3);
  i "power 0 5"  (fun () -> Calc_int.power 0 5);
  i "power -2 3" (fun () -> Calc_int.power (-2) 3);
  i "fact -1" (fun () -> Calc_int.fact (-1));
  i "fact 0" (fun () -> Calc_int.fact 0);
  i "fact 5" (fun () -> Calc_int.fact 5);

  print_endline "\n\x1b[90mFloat - add, sub, div, mul\x1b[0m";
  fl "add 0.1 0.2"    (fun () -> Calc_float.add 0.1 0.2);
  fl "sub 42.0 zero1" (fun () -> Calc_float.sub 42.0 FLOAT.zero1);
  fl "div 1.0 4.0"    (fun () -> Calc_float.div 1.0 4.0);
  fl "div 1.0 0.0"    (fun () -> Calc_float.div 1.0 0.0);
  fl "div 42.0 zero2" (fun () -> Calc_float.div 42.0 FLOAT.zero2);
  fl "mul 6.0 7.0"    (fun () -> Calc_float.mul 6.0 7.0);

  print_endline "\n\x1b[90mFloat - power, factorial\x1b[0m";
  fl "power 2.0 3" (fun () -> Calc_float.power 2.0 3);
  fl "power 2.0 0" (fun () -> Calc_float.power 2.0 0);
  fl "power 2.0 3" (fun () -> Calc_float.power 2.0 3);
  fl "fact 0.0"    (fun () -> Calc_float.fact 0.0);
  fl "fact 5.0"    (fun () -> Calc_float.fact 5.0)
