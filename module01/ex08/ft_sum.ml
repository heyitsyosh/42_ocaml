let ft_sum expr start_i last_i =
  if last_i < start_i then
    nan
  else
    let rec loop i sum =
      if i = last_i then
        sum +. expr i
      else
        loop (i + 1) (sum +. expr i)
    in
    loop start_i (float_of_int 0)

(* ────── Tests ────── *)

let test label expr lower upper =
  Printf.printf "Σ {i=%d..%d} (%s) → " lower upper label;
  print_float(ft_sum expr lower upper);
  print_newline ()

let () =
  print_endline "\x1b[4;37mft_sum:\x1b[0m";
  test "i" (fun i -> float_of_int i) 3 1; 
  test "i" (fun i -> float_of_int i) 1 3;
  test "1.0" (fun i -> 1.0) 1 5;
  test "i * i"(fun i -> float_of_int (i * i)) 1 10
