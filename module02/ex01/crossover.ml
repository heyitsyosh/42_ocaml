let crossover list1 list2 =
  let rec iter = function
  | [] -> []
  | x :: xs -> 
    let rec find_common = function
    | [] -> None
    | y :: ys when x = y -> Some y
    | _ :: ys -> find_common ys
    in
    match find_common list2 with
    | None -> iter xs
    | Some common_elem -> common_elem :: iter xs
  in
  iter list1

(* ────── Tests ────── *)

let test l1 l2 =
  Printf.printf "[%s] [%s] → [%s]\n"
    (String.concat "," (List.map string_of_int l1))
    (String.concat "," (List.map string_of_int l2))
    (String.concat "," (List.map string_of_int (crossover l1 l2)))

let () =
  print_endline "\x1b[4;37mcrossover:\x1b[0m";
  test [] [];
  test [1;2;3] [];
  test [] [1;2;3];
  test [1;2;3] [2;4;6];
  test [1;2;3;4] [4;3;2;1];
  test [5;6;7] [1;2;3];
  test [1;1;2;3] [1;3;3;4]