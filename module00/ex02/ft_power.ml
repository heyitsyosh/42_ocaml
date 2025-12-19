let rec ft_power n power =
  if power = 0 then
    1
  else
    n * (ft_power n (power - 1))
