let encode = function
| [] -> []
| x :: xs ->
  let rec loop i current = function
  | [] -> [(i, current)]
  | y :: ys when y = current -> loop (i + 1) current ys
  | y :: ys -> (i, current) :: loop 1 y ys
  in
  loop 1 x xs

(* ────── Tests ────── *)

let test l =
  List.iter (fun c -> Printf.printf "%c" c) l;
  Printf.printf " → ";
  List.iter (fun (n,c) -> Printf.printf "(%d,%c) " n c) (encode l);
  print_newline ()

let test_int l =
  List.iter (fun c -> Printf.printf "%d" c) l;
  Printf.printf " → ";
  List.iter (fun (n,d) -> Printf.printf "(%d,%d) " n d) (encode l);
  print_newline ()

let () =
  print_endline "\x1b[4;37mencode:\x1b[0m";
  test ['a';'a';'a';'b';'b'];
  test ['a';'b';'b';'c'];
  test_int [12; 12; 12; 3; 3; 4];
  test_int [1; 2; 2; 3; 3; 3];
  test_int [];
