let ft_is_palindrome str =
  let len = String.length str in
  let rec compare front back =
    if front = len / 2 then
      true
    else if (String.get str front) <> (String.get str back) then
      false
    else
      compare (front + 1) (back - 1)
  in
  compare 0 (len - 1)
