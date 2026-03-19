class ['a] army =
  object (self)
    val mutable members : 'a list = []

    method add new_member =
      members <- new_member :: members

    method delete =
    match members with
    | [] -> members <- []
    | x :: xs -> members <- xs

    method to_string =
      let rec loop = function
      | [] -> ""
      | x :: [] -> x#get_name
      | x :: xs ->
        x#get_name ^ ", " ^ loop xs
      in
      "Army: " ^ loop members
  end
