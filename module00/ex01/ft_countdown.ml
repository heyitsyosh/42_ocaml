let rec ft_countdown x =
  let n = if x < 0 then 0 else x in
  print_int n;
  print_newline ();
  if n > 0 then
    ft_countdown (n - 1)
