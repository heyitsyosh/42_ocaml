module type FRACTIONAL_BITS = sig
  val bits : int
end

module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val gte : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool (** physical equality *)
  val eqs : t -> t -> bool (** structural equality *)
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module Make(M : FRACTIONAL_BITS): FIXED = struct
  type t = int
  let bits = M.bits
  let of_float input = int_of_float (Float.round (input *. float_of_int (1 lsl bits)))
  let of_int input = input lsl bits
  let to_float a = float_of_int a /. float_of_int (1 lsl bits)
  let to_int a = a lsr bits
  let to_string a = string_of_float @@ to_float a
  let zero = of_int 0
  let one = of_int 1
  let succ a = a + 1
  let pred a = a - 1
  let min a b = if b < a then b else a
  let max a b = if b > a then b else a
  let gth a b = a > b
  let lth a b = a < b
  let gte a b = a >= b
  let lte a b = a <= b
  let eqp a b = a == b
  let eqs a b = a = b
  let add a b = a + b
  let sub a b = a - b
  let mul a b = (a * b) lsr bits
  let div a b = (a lsl bits) / b
  let foreach a b func =
    let rec loop current =
      if lte current b then (
        func current;
        loop (succ current)
      )
    in loop a
end

module Fixed4 : FIXED = Make(struct let bits = 4 end)
module Fixed8 : FIXED = Make(struct let bits = 8 end)

let () =
  print_endline "\x1b[4;37mFixed notation functor:\x1b[0m";
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f-> print_endline (Fixed4.to_string f));

  let a = Fixed8.of_int 3 in
  let b = Fixed8.of_int 7 in

  Printf.printf "\nto_int 3: %d\n" (Fixed8.to_int a);
  Printf.printf "to_float 3: %f\n" (Fixed8.to_float a);
  Printf.printf "succ 3: %d\n" (Fixed8.to_int (Fixed8.succ a));
  Printf.printf "pred 3: %d\n" (Fixed8.to_int (Fixed8.pred a));
  Printf.printf "min 3 7: %d\n" (Fixed8.to_int (Fixed8.min a b));
  Printf.printf "max 3 7: %d\n" (Fixed8.to_int (Fixed8.max a b));
  Printf.printf "gth 7 3: %b\n" (Fixed8.gth b a);
  Printf.printf "lth 3 7: %b\n" (Fixed8.lth a b);
  Printf.printf "gte 3 3: %b\n" (Fixed8.gte a a);
  Printf.printf "gte 3 7: %b\n" (Fixed8.gte a b);
  Printf.printf "lte 3 3: %b\n" (Fixed8.lte a a);
  Printf.printf "eqs 3 3: %b\n" (Fixed8.eqs a a);
  Printf.printf "eqp 3 3: %b\n" (Fixed8.eqp a a);
  Printf.printf "add 3+7: %d\n" (Fixed8.to_int (Fixed8.add a b));
  Printf.printf "sub 7-3: %d\n" (Fixed8.to_int (Fixed8.sub b a));
  Printf.printf "mul 3*7: %d\n" (Fixed8.to_int (Fixed8.mul a b));
  Printf.printf "div 7/3: %d\n" (Fixed8.to_int (Fixed8.div b a));
