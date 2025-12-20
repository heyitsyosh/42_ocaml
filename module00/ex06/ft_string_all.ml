let ft_string_all func str =
  let rec loop i =
    if i < 0 then
      true
    else if not (func (String.get str i)) then
      false
    else
      loop (i - 1)
  in
  loop (String.length str - 1)
