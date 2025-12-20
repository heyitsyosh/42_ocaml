let rec repeat_string ?str:(str="x") n =
  if n < 0 then
    "Error"
  else if n = 0 then
    ""
  else
    str ^ repeat_string ~str (n - 1)
