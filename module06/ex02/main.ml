let () =
  Random.self_init ();
  print_endline "\x1b[4;37mDalek:\x1b[0m";

  let donna = new People.people "Donna" in
  let doc   = new Doctor.doctor ~sidekick:donna ~age:100 in
  let dalek = new Dalek.dalek in

  print_endline "\n--- Everyone introduces themselves ---";
  doc#talk;
  donna#talk;
  dalek#talk;

  print_endline "\n--- Dalek attacks Donna ---";
  dalek#exterminate donna;
  donna#talk;

  print_endline "\n--- Dalek attacks the Doctor ---";
  dalek#exterminate_doctor doc;
  doc#talk;
  print_endline doc#to_string;

  print_endline "\n--- Dalek attacks Doctor again ---";
  dalek#exterminate_doctor doc;
  doc#talk;
  doc#travel_in_time 2024 1000;
  doc#use_sonic_screwdriver;

  print_endline "\n--- Dalek dies ---";
  dalek#die;
  dalek#talk;

  print_endline "\n--- Final state ---";
  print_endline doc#to_string;
  print_endline donna#to_string;
  print_endline dalek#to_string