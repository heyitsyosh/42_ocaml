class virtual molecule (n: string) (a: Atom_base.atom list) =
  object (self)
		val mutable formula_ = ""

    method name = n
    method formula = formula_

    method to_string =
      "name: " ^ self#name ^ ", formula: " ^ self#formula

    method equals : 'a. (<name: string; formula: string; ..> as 'a) -> bool =
      fun other ->
        self#name = other#name
        && self#formula = other#formula

    initializer
      let sorted = List.fast_sort (fun x y -> String.compare (x#symbol) (y#symbol)) a in
			let to_hill_notation = function
      | [] -> ""
      | x :: xs ->
				let to_subscript num =
					if num > 1 then string_of_int num
					else ""
				in
				let rec loop count current = function
				| [] -> current#symbol ^ to_subscript count
				| y :: ys when y#symbol = current#symbol -> loop (count + 1) current ys
				| y :: ys -> (current#symbol ^ to_subscript count) ^ loop 1 y ys
				in
				loop 1 x xs
      in
      formula_ <- to_hill_notation sorted
  end 
