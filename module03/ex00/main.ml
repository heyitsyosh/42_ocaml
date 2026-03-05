let () =
  print_endline "\x1b[4;37mColor:\x1b[0m";
  Printf.printf "%-7s %-4s\n" "Verbose" "Short";
  Printf.printf "%s\n" (String.make 12 '-');
  List.iter (fun c ->
    Printf.printf "%-7s %-4s\n"
      (Color.toStringVerbose c)
      (Color.toString c)
  ) Color.all;
