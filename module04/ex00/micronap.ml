let my_sleep () = Unix.sleep 1

let () =
  if Array.length Sys.argv > 1 then
    let seconds = try int_of_string Sys.argv.(1)
      with _ -> exit 0
    in
    for i = 0 to seconds - 1 do
      print_string (string_of_int (i + 1) ^ "...");
      flush stdout;
      my_sleep ()
    done;
    if seconds > 0 then print_newline ()
