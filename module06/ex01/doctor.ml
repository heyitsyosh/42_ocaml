class doctor ~age ~sidekick =
  object (self)
    val name = "The Doctor"
    val mutable age = age
    val sidekick = sidekick
    val mutable hp = 100

    method to_string =
      "name: " ^ name ^
      ", age: " ^ string_of_int age ^
      ", sidekick: " ^ sidekick#get_name ^
      ", hp: " ^ string_of_int hp

    method talk =
      print_endline "Hi! I'm the Doctor!"

    method travel_in_time start arrival =
      print_endline {|    ____,^.____
 ,-'-----------'-.
|_POLICE_%&%&_BOX_|
 | _____ | _____ |
 || | | ||| | | ||
 ||-|-|-|||-|-|-||
 ||_|_|_|||_|_|_||
 |.----. | .----.|
 ||    | | |    ||
 |'----' | '----'|
 |.----. | .----.|
 ||    | | |    ||
 |'----' | '----'|
 |.----. | .----.|
 ||    | | |    ||
_|'----' | '----'|_|};
      let get_date_unit year =
        if year < 0 then "BC" else "AD"
      in
      age <- age + arrival - start;
      print_endline
        ("Travelling from " ^ string_of_int (abs start) ^ get_date_unit start ^
        " to " ^ string_of_int (abs arrival) ^ get_date_unit arrival ^ ".");
      print_endline (name ^ " is now " ^ string_of_int age ^ " years old.")

    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"

    method private regenerate =
      hp <- 100

    initializer
      print_endline ("A new doctor appears... " ^ self#to_string)
  end
