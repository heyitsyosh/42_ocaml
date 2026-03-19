let () =
  print_endline "\x1b[4;37mArmy:\x1b[0m";

  (* Army of people *)
  print_endline "── People Army ──";
  let people_list : People.people list = [
    new People.people "Rose";
    new People.people "Donna";
  ] in
  let people_army = new Army.army people_list in
  let amy = new People.people "Amy" in
  people_army#add amy; 
  print_endline people_army#to_string;

  print_endline "\n[Delete 3 times...]";
  let n = 3 in
  let rec loop i =
    if i < n then (
    people_army#delete;
    print_endline people_army#to_string;
    loop (i + 1)
    )
  in loop 0;

  (* Army of doctors *)
  print_endline "\n── Doctor Army ──";
  let doctor_army = new Army.army [] in
  let rose = new People.people "Rose" in
  doctor_army#add (new Doctor.doctor ~age:900 ~sidekick:rose);
  print_endline doctor_army#to_string;
  doctor_army#delete;
  print_endline doctor_army#to_string;

  (* Army of daleks *)
  print_endline "\n── Dalek Army ──";
  let dalek = new Dalek.dalek in
  let dalek_army = new Army.army [dalek] in
  print_endline dalek_army#to_string;
  dalek_army#delete;
  print_endline dalek_army#to_string;
