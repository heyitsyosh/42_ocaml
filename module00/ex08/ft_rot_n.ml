let ft_rot_n n str =
  let shift_char c =
    if 'a' <= c && c <= 'z' then
      let base = int_of_char 'a' in
      char_of_int ((int_of_char c - base + n) mod 26 + base)
    else if 'A' <= c && c <= 'Z' then
      let base = int_of_char 'A' in
      char_of_int ((int_of_char c - base + n) mod 26 + base)
    else
      c
  in
  String.map shift_char str
