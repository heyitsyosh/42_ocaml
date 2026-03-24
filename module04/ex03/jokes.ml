let read_jokes ic =
  let jokes = ref [] in
  (try
    while true do
      let line = input_line ic in
      if line <> "" then
        jokes := line :: !jokes
    done
  with End_of_file -> ());
  Array.of_list (List.rev !jokes)

let () =
  let joke_file =
    try open_in Sys.argv.(1)
    with _ -> prerr_endline "Error: could not open joke file"; exit 0
  in
  let jokes = read_jokes joke_file in
  close_in joke_file;
  Random.self_init ();
  let i = Random.int (Array.length jokes) in
  print_endline jokes.(i)
