class people n =
  object (self)
    val name = n
    val mutable hp = 100

    method get_name = name

    method to_string =
      "name: " ^ name ^  ", hp: " ^ (string_of_int hp)

    method is_alive = hp > 0

    method talk =
      if self#is_alive then print_endline ("I'm " ^ name ^ "! Do you know the Doctor?")
      else print_endline (name ^ " is dead and cannot speak.")

    method die =
      hp <- 0;
      print_endline "Aaaarghh!"

    initializer
      print_endline ("A new person appears... " ^ self#to_string)
  end
