let print_card_values card =
  Printf.printf "%-7s %-4s\n"
		(Value.toStringVerbose card)
		(Value.toString card)

let print_cards_from next start =
  let rec loop card =
    print_card_values card;
    try
			loop (next card)
    with
			Invalid_argument msg -> print_endline ("Invalid arg: " ^ msg)
  in
  loop start

let print_header title =
  print_endline title;
  Printf.printf "%-7s %-4s\n" "Verbose" "Short";
  Printf.printf "%s\n" (String.make 12 '-')

let () =
  print_endline "\x1b[4;37mValue module:\x1b[0m";

  print_header "Ascending with Value.next:";
  print_cards_from Value.next Value.T2;

  print_endline "";
  print_header "Descending with Value.previous:";
  print_cards_from Value.previous Value.Ace