module StringSet = Set.Make(String)

let () =
  print_endline "\x1b[4;37mSet functor:\x1b[0m";
  let set = List.fold_right StringSet.add [ "foo"; "bar"; "baz"; "qux" ] StringSet.empty in
  StringSet.iter print_endline set;
  print_endline (StringSet.fold ( ^ ) set "")
