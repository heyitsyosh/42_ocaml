let () =
  print_endline "\x1b[4;37mAlkane - to_string:\x1b[0m";
  List.iter (fun a -> print_endline a#to_string) [
    new Alkane.methane;
    new Alkane.ethane;
    new Alkane.octane;
    new Alkane.butane;
  ];
  print_endline "\x1b[4;37mAlkane - equals:\x1b[0m";
  Printf.printf "methane = methane: %b\n" ((new Alkane.methane)#equals (new Alkane.methane));
  Printf.printf "methane = ethane: %b\n"   ((new Alkane.methane)#equals (new Alkane.ethane))
