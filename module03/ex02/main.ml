let print_cards label cards =
  Printf.printf "%-20s -> " label;
  List.iter (fun card -> Printf.printf "%s " (Card.toString card)) cards;
  print_newline ()

let test_card label card =
  Printf.printf "%-20s -> %s\n" label (Card.toStringVerbose card)

let test_string label value =
  Printf.printf "%-20s -> %s\n" label value

let test_int label value =
  Printf.printf "%-20s -> %d\n" label value

let test_bool label value =
  Printf.printf "%-20s -> %b\n" label value

let test_best label cards =
  try
    Printf.printf "%-20s -> %s\n" label
      (Card.toStringVerbose (Card.best cards))
  with
  | Invalid_argument msg ->
      Printf.printf "%-20s -> Invalid arg: %s\n" label msg

let () =
  print_endline "\x1b[4;37mCard tests:\x1b[0m";

  let ace_spade = Card.newCard Card.Value.Ace Card.Suit.Spade in
  let ace_heart = Card.newCard Card.Value.Ace Card.Suit.Heart in
  let queen_diamond = Card.newCard Card.Value.Queen Card.Suit.Diamond in
  let king_club = Card.newCard Card.Value.King Card.Suit.Club in
  let jack_spade = Card.newCard Card.Value.Jack Card.Suit.Spade in
  let two_club = Card.newCard Card.Value.T2 Card.Suit.Club in
  let two_spade = Card.newCard Card.Value.T2 Card.Suit.Spade in

  test_card "newCard Ace Spade" ace_spade;
  print_newline ();

  print_cards "allSpades" Card.allSpades;
  print_cards "allHearts" Card.allHearts;
  print_cards "allDiamonds" Card.allDiamonds;
  print_cards "allClubs" Card.allClubs;
  test_int "all length" (List.length Card.all);
  print_newline ();

  test_string "getValue King Club"
    (Card.Value.toStringVerbose (Card.getValue king_club));
  test_string "getSuit King Club"
    (Card.Suit.toStringVerbose (Card.getSuit king_club));
  test_string "toString QD"
    (Card.toString queen_diamond);
  test_string "toStringVerbose QD"
    (Card.toStringVerbose queen_diamond);
  print_newline ();

  test_int "compare 2S AH"
    (Card.compare two_spade ace_heart);
  test_int "compare AH 2S"
    (Card.compare ace_heart two_spade);
  test_int "compare 2S 2C"
    (Card.compare two_spade two_club);
  test_card "min JS KC"
    (Card.min jack_spade king_club);
  test_card "max JS KC"
    (Card.max jack_spade king_club);
  test_card "max 2C 2S"
    (Card.max two_club two_spade);
  print_newline ();

  test_best "best []" [];
  test_best "best [AS KC QD]" [ace_spade; king_club; queen_diamond];
  print_newline ();

  test_bool "isSpade AS"
    (Card.isSpade ace_spade);
  test_bool "isSpade AH"
    (Card.isSpade ace_heart);
  test_bool "isHeart AH"
    (Card.isHeart ace_heart);
  test_bool "isHeart AS"
    (Card.isHeart ace_spade);
  test_bool "isDiamond QD"
    (Card.isDiamond queen_diamond);
  test_bool "isDiamond KC"
    (Card.isDiamond king_club);
  test_bool "isClub KC"
    (Card.isClub king_club);
  test_bool "isClub QD"
    (Card.isClub queen_diamond)
