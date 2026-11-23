module Watchtower : sig
  type hour = int

  val zero : hour
  val add : hour -> hour -> hour
  val sub : hour -> hour -> hour
end = struct
  type hour = int

  let zero : hour = 0

  let add (hour1 : hour) (hour2 : hour) : hour =
    (((hour1 + hour2) mod 12) + 12) mod 12

  let sub (hour1 : hour) (hour2 : hour) : hour =
    (((hour1 - hour2) mod 12) + 12) mod 12
end

let test_operation op hour1 hour2 =
  let result =
    match op with
    | '+' -> Watchtower.add hour1 hour2
    | '-' -> Watchtower.sub hour1 hour2
    | _ -> invalid_arg "test_operation: expected '+' or '-'"
  in
  print_endline
    (string_of_int hour1 ^ " " ^ String.make 1 op ^ " "
    ^ string_of_int hour2 ^ " = " ^ string_of_int result)

let () =
  print_endline "\x1b[4;37mWatchtower:\x1b[0m";
  test_operation '+' Watchtower.zero Watchtower.zero;
  test_operation '+' 6 6;
  test_operation '+' 12 12;
  test_operation '+' 42 3;
  test_operation '+' (-6) 3;

  test_operation '-' 12 11;
  test_operation '-' 12 13
