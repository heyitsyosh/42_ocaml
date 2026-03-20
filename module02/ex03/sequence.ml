let sequence n =
  if n <= 0 then ""
  else
    let rec next = function
      | [] -> []
      | x :: xs ->  
        let rec count_consecutive count current = function
          | [] -> [count; current]
          | y :: ys when y = current -> count_consecutive (count + 1) current ys
          | y :: ys -> count :: current :: count_consecutive 1 y ys
        in
        count_consecutive 1 x xs
    in
    let rec build_term i term =
      if i = n then
        let rec term_to_string = function
          | [] -> ""
          | x :: xs -> string_of_int x ^ term_to_string xs
        in
        term_to_string term
      else
        build_term (i + 1) (next term)
    in
    build_term 1 [1]

(* ────── Tests ────── *)

let () =
  print_endline "\x1b[4;37msequence:\x1b[0m";
  let max = 10 in
  let rec loop i =
    if i <= max then (
      Printf.printf "%2d: " i;
      print_endline (sequence i);
      loop (i + 1)
    )
    else ()
  in loop (-1)

