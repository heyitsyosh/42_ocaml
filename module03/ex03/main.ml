let test_string_list label lst =
  Printf.printf "%-20s -> " label;
  List.iter (fun s -> Printf.printf "%s " s) lst;
  print_newline ()

let rec take n lst =
  match (n, lst) with
  | (0, _) | (_, []) -> []
  | (n, x :: xs) -> x :: take (n - 1) xs

let () =
  Random.self_init ();

  print_endline "\x1b[4;37mDeck tests:\x1b[0m";

  let deck  = Deck.newDeck () in
  let deck2 = Deck.newDeck () in

  test_string_list "first 6 of deck"  (take 6 (Deck.toStringList deck));
  test_string_list "first 6 of deck2" (take 6 (Deck.toStringList deck2));
  test_string_list "first 6 verbose"  (take 6 (Deck.toStringListVerbose deck));
  test_string_list "full deck size"   [string_of_int (List.length (Deck.toStringList deck))];
  print_newline ();

  Printf.printf "%-20s -> " "drawing cards";
  let rec draw_all deck i =
    if i > 53 then ()
    else
      (try
        let (card, rest) = Deck.drawCard deck in
        Printf.printf "%s, " (Deck.Card.toString card);
        draw_all rest (i + 1)
      with
      | Failure msg ->
        Printf.printf "\x1b[31mFailure (i=%d): %s\x1b[0m\n" i msg)
  in
  draw_all deck 1;
  print_newline ();


  let ace_spade = Deck.Card.newCard Deck.Card.Value.Ace Deck.Card.Suit.Spade in
  Printf.printf "%-20s -> %s\n" "test submodules" (Deck.Card.toString ace_spade)
