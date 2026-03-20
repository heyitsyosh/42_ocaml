class virtual atom (n: string) (s: string) (an: int) =
  object (self)
    method name = n
    method symbol = s
    method atomic_number = an

    method to_string =
      "name: " ^ self#name ^
      ", symbol: " ^ self#symbol ^
      ", atomic number: " ^ (string_of_int self#atomic_number)

    method equals : 'a. (< name : string; symbol : string; atomic_number : int; .. > as 'a) -> bool =
      fun other ->
        self#name = other#name
        && self#symbol = other#symbol
        && self#atomic_number = other#atomic_number
end
