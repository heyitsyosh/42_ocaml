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

    method is_alive = hp > 0

    method talk =
      if self#is_alive then print_endline "Hi! I'm the Doctor!"
      else print_endline (name ^ " is dead and cannot speak.")

    method travel_in_time start arrival =
      if self#is_alive then (
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
      )
      else print_endline (name ^ " is dead and cannot time travel.")

    method use_sonic_screwdriver =
      if self#is_alive then print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
      else print_endline (name ^ " is dead and cannot use the sonic screwdriver.")

    method take_damage = if self#is_alive then hp <- hp - 50

    method private regenerate =
      if self#is_alive then hp <- 100
      else print_endline (name ^ " is dead and cannot regenerate.")

    initializer
      print_endline ("A new doctor appears... " ^ self#to_string)
  end
