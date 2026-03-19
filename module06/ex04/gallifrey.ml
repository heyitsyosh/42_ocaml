class gallifrey ppl docs dlks =
  object (self)
    val people  = new Army.army ppl
    val doctors = new Army.army docs
    val daleks  = new Army.army dlks

    method private any_alive : 'a. (< is_alive : bool; .. > as 'a) list -> bool = function
      | [] -> false
      | x :: xs -> x#is_alive || self#any_alive xs

    method private first_alive : 'a. (< is_alive : bool; .. > as 'a) list -> 'a option = function
      | [] -> None
      | x :: xs -> if x#is_alive then Some x else self#first_alive xs

    method private dalek_turn = function
      | [] -> ()
      | dalek :: rest ->
        if dalek#is_alive then (
          match self#first_alive ppl with
          | Some p -> dalek#exterminate p
          | None ->
            match self#first_alive docs with
            | Some d -> dalek#exterminate_doctor d
            | None -> ()
        );
        self#dalek_turn rest

    method private doctor_turn = function
      | [] -> ()
      | doc :: rest ->
        if doc#is_alive then (
          match self#first_alive dlks with
          | Some d -> d#die
          | None -> ()
        );
        self#doctor_turn rest

    method do_time_war =
      print_endline "=== THE TIME WAR BEGINS ===";
      let rec war () =
        if not (self#any_alive dlks && (self#any_alive ppl || self#any_alive docs))
        then ()
        else (
          self#dalek_turn dlks;
          self#doctor_turn docs;
          war ()
        )
      in
      war ();
      print_endline "=== THE TIME WAR ENDS ===";
      if self#any_alive dlks
      then print_endline "The Daleks have won!"
      else print_endline "Gallifrey stands!"
  end
