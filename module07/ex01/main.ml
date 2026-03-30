let () =
  print_endline "\x1b[4;37mMolecule - to_string:\x1b[0m";
  List.iter (fun m -> print_endline m#to_string) [
    new Molecule.water;
    new Molecule.carbon_dioxide;
    new Molecule.ammonia;
    new Molecule.methane;
    new Molecule.sulfur_dioxide;
  ];
  print_endline "\x1b[4;37mMolecule - equals:\x1b[0m";
  Printf.printf "water = water: %b\n" ((new Molecule.water)#equals (new Molecule.water));
  Printf.printf "water = co2: %b\n" ((new Molecule.water)#equals (new Molecule.carbon_dioxide))
