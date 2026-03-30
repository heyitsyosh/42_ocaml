let () =
  print_endline "\x1b[4;37mAtom - to_string:\x1b[0m";
  (* print_endline (new Atom_base.atom "Test" "T" 1)#to_string; *)
  List.iter (fun a -> print_endline a#to_string) [
    new Atom.hydrogen;
    new Atom.carbon;
    new Atom.oxygen;
    new Atom.sodium;
    new Atom.chlorine;
    new Atom.nitrogen;
  ];
  print_endline "\x1b[4;37mAtom - equals:\x1b[0m";
  Printf.printf "hydrogen = hydrogen: %b\n" ((new Atom.hydrogen)#equals (new Atom.hydrogen));
  Printf.printf "hydrogen = carbon: %b\n"   ((new Atom.hydrogen)#equals (new Atom.carbon))
