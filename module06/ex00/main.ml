let () =
  print_endline "\x1b[4;37mPeople:\x1b[0m";
  let donna = new People.people "Donna" in
  donna#talk;
  donna#die;
  donna#talk
