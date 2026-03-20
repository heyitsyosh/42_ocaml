class dalek =
  object (self)
    val mutable name = "Dalek"
    val mutable hp = 100
    val mutable shield = true

    method get_name = name

    method to_string =
      "name: " ^ name ^
      ", hp: " ^ string_of_int hp ^
      ", shield: " ^ string_of_bool shield

    method is_alive = hp > 0

    method talk =
      if self#is_alive then
        let lines = [|
          "Explain! Explain!";
          "Exterminate! Exterminate!";
          "I obey!";
          "You are the Doctor! You are the enemy of the Daleks!"
        |] in
        print_endline lines.(Random.int 4)
      else print_endline (name ^ " is dead and cannot speak.")

    method exterminate (person : People.people) =
      if self#is_alive then (
        person#die;
        shield <- not shield
      )
      else print_endline (name ^ " is dead and cannot exterminate.")

    method exterminate_doctor (doc : Doctor.doctor) =
      if self#is_alive then (
        doc#take_damage;
        shield <- not shield
      )
      else print_endline (name ^ " is dead and cannot exterminate.")

    method die =
      if self#is_alive then print_endline "Emergency Temporal Shift!";
      hp <- 0
    
    initializer
      let generate_name =
        let capital_consonants = [|'B';'C';'D';'F';'G';'H';'J';'K';'L';'M';'N';'P';'Q';'R';'S';'T';'V';'W';'X';'Y';'Z'|] in
        let lowercase_consonants = [|'b';'c';'d';'f';'g';'h';'j';'k';'l';'m';'n';'p';'q';'r';'s';'t';'v';'w';'x';'y';'z'|] in
        let lowercase_vowels = [|'a';'e';'i';'o';'u'|] in
        let c1 = capital_consonants.(Random.int 21) in
        let v  = lowercase_vowels.(Random.int 5) in
        let c2 = lowercase_consonants.(Random.int 21) in
        String.make 1 c1 ^ String.make 1 v ^ String.make 1 c2
      in
      name <- name ^ generate_name;
      print_endline ("A new dalek appears... " ^ self#to_string)
  end
