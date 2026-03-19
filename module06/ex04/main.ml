let () =
  Random.self_init ();
  print_endline "\x1b[4;37mGalifrey:\x1b[0m";

  let rose  = new People.people "Rose" in
  let donna = new People.people "Donna" in
  let amy   = new People.people "Amy" in

  let doctor1 = new Doctor.doctor ~age:900  ~sidekick:rose in
  let doctor2 = new Doctor.doctor ~age:1200 ~sidekick:donna in

  let dalek1 = new Dalek.dalek in
  let dalek2 = new Dalek.dalek in
  let dalek3 = new Dalek.dalek in

  let g = new Gallifrey.gallifrey
    [rose; donna; amy]
    [doctor1; doctor2]
    [dalek1; dalek2; dalek3]
  in
  g#do_time_war
