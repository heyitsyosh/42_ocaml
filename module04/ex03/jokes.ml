let read_lines ic count =
  let i = ref 0 in
  let lines = Array.make count "" in 
  (try
    while !i < count do
      let one_line = input_line ic in
      if one_line <> "" then (
        lines.(!i) <- one_line;
        i := !i + 1
      )
    done
  with End_of_file -> ());
  lines

let get_rand_i count =
  let rand_file = open_in "/dev/urandom" in
  let seed = input_binary_int rand_file in
  close_in rand_file;
  abs seed mod count

let () =
  let joke_file =
    try open_in Sys.argv.(1)
    with _ -> prerr_endline ("Error: could not open joke file"); exit 0
  in
  let count = 
    try int_of_string (input_line joke_file)
    with e -> prerr_endline ("Error: joke file has wrong format"); exit 0
  in
  let jokes = read_lines joke_file count in
  close_in joke_file;
  let i = get_rand_i count in
  print_endline jokes.(i)
