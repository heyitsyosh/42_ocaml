type 'a ft_ref = { mutable contents : 'a }

let return v = { contents = v }
let get ft_ref = ft_ref.contents
let set ft_ref v = ft_ref.contents <- v
let bind ft_ref func = func ft_ref.contents

(* ────── Tests ────── *)

let print_result label r =
  Printf.printf "%s → %d\n" label (get r)

let print_result_str label r =
  Printf.printf "%s → \"%s\"\n" label (get r)

let () =
  print_endline "\x1b[4;37mft_ref:\x1b[0m";
  let r = return 42 in
  print_result "return 42" r;
  set r 100;
  print_result "set 100" r;
  print_result "bind (*2)" (bind r (fun x -> return (x * 2)));
  print_result_str "bind string_of_int" (bind r (fun x -> return (string_of_int x)));
  print_result "original after bind" r
