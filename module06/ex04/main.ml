let () =
  Random.self_init ();
  print_endline "\x1b[4;37mGalifrey:\x1b[0m";

  let rose  = new People.people "Rose"
  and donna = new People.people "Donna"
  and amy   = new People.people "Amy" in

  let doctor1 = new Doctor.doctor ~age:900  ~sidekick:rose
  and doctor2 = new Doctor.doctor ~age:1200 ~sidekick:donna

  and dalek1 = new Dalek.dalek
  and dalek2 = new Dalek.dalek
  and dalek3 = new Dalek.dalek in

  let g = new Gallifrey.gallifrey
    [rose; donna; amy]
    [doctor1; doctor2]
    [dalek1; dalek2; dalek3]
  in
  g#do_time_war
