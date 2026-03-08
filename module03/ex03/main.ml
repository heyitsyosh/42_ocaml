let print_cards label cards =
  Printf.printf "%-20s -> " label;
  List.iter (fun card -> Printf.printf "%s " (Deck.Card.toString card)) cards;
  print_newline ()

let test_string_list label lst =
  Printf.printf "%-20s -> " label;
  List.iter (fun s -> Printf.printf "%s " s) lst;
  print_newline ()

let test_int label value =
  Printf.printf "%-20s -> %d\n" label value

let test_draw label deck =
  try
    let (card, rest) = Deck.drawCard deck in
    Printf.printf "%-20s -> drew %s | %d cards remaining\n"
      label
      (Deck.Card.toString card)
      (List.length rest)
  with
  | Failure msg ->
      Printf.printf "%-20s -> Failure: %s\n" label msg

let rec take n lst =
  match (n, lst) with
  | (0, _) | (_, []) -> []
  | (n, x :: xs) -> x :: take (n - 1) xs

let () =
  Random.self_init ();

  print_endline "\x1b[4;37mDeck tests:\x1b[0m";

  let deck = Deck.newDeck () in
  let str_list = Deck.toStringList deck in
  let verbose_list = Deck.toStringListVerbose deck in

  test_int "newDeck length" (List.length deck);
  print_newline ();

  print_cards "first 6 cards" (take 6 deck);
  test_string_list "first 6 strings" (take 6 str_list);
  test_string_list "first 6 verbose" (take 6 verbose_list);
  print_newline ();

  test_draw "drawCard deck" deck;
  test_draw "drawCard []" [];
  print_newline ();

  let ace_spade =
    Deck.Card.newCard
      Deck.Card.Value.Ace
      Deck.Card.Suit.Spade
  in
  print_cards "test submodules" [ace_spade];
