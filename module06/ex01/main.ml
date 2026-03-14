let () =
  print_endline "\x1b[4;37mDoctor:\x1b[0m";
  let donna = new People.people "Donna" in
  let doctor = new Doctor.doctor ~age:300  ~sidekick:donna in
  doctor#talk;
  doctor#use_sonic_screwdriver;
  doctor#travel_in_time 2000 2001;
  doctor#travel_in_time (-100) 100
