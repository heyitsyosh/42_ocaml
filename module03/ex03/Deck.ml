module Card = struct
  module Suit = struct
    type t = Spade | Heart | Diamond | Club
    let all = [Spade; Heart; Diamond; Club]

    let toString card =
      match card with
      | Spade -> "S"
      | Heart -> "H"
      | Diamond -> "D"
      | Club -> "C"

    let toStringVerbose card =
      match card with
      | Spade -> "Spade"
      | Heart -> "Heart"
      | Diamond -> "Diamond"
      | Club -> "Club"
  end

  module Value = struct
    type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | Ace
    let all = [T2 ; T3 ; T4 ; T5 ; T6 ; T7 ; T8 ; T9 ; T10 ; Jack ; Queen ; King ; Ace]

    let toInt = function
    | T2 -> 1
    | T3 -> 2
    | T4 -> 3
    | T5 -> 4
    | T6 -> 5
    | T7 -> 6
    | T8 -> 7
    | T9 -> 8
    | T10 -> 9
    | Jack -> 10
    | Queen -> 11
    | King -> 12
    | Ace -> 13

    let toString = function
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "J"
    | Queen -> "Q"
    | King -> "K"
    | Ace -> "A"

    let toStringVerbose = function
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "Jack"
    | Queen -> "Queen"
    | King -> "King"
    | Ace -> "Ace"

    let next = function
    | T2 -> T3
    | T3 -> T4
    | T4 -> T5
    | T5 -> T6
    | T6 -> T7
    | T7 -> T8
    | T8 -> T9
    | T9 -> T10
    | T10 -> Jack
    | Jack -> Queen
    | Queen -> King
    | King -> Ace
    | Ace -> invalid_arg "No next card for Ace"

    let previous = function
    | T2 -> invalid_arg "No previous card for T2"
    | T3 -> T2
    | T4 -> T3
    | T5 -> T4
    | T6 -> T5
    | T7 -> T6
    | T8 -> T7
    | T9 -> T8
    | T10 -> T9
    | Jack -> T10
    | Queen -> Jack
    | King -> Queen
    | Ace -> King
  end

  type t = Value.t * Suit.t

  let newCard value suit = (value, suit)

  let allSpades = List.map (fun value -> (value, Suit.Spade)) Value.all
  let allHearts =  List.map (fun value -> (value, Suit.Heart)) Value.all
  let allDiamonds = List.map (fun value -> (value, Suit.Diamond)) Value.all
  let allClubs =  List.map (fun value -> (value, Suit.Club)) Value.all
  let all = allSpades @ allHearts @ allDiamonds @ allClubs

  let getValue (value, _) = value
  let getSuit (_, suit) = suit

  let toString (value, suit)= Value.toString value ^ Suit.toString suit
  let toStringVerbose (value, suit) =
    Printf.sprintf "Card(%s, %s)"
    (Value.toStringVerbose value)
    (Suit.toStringVerbose suit)

  let compare (v1, _) (v2, _) =
    if v1 > v2 then 1
    else if v1 < v2 then -1
    else 0

  let min card1 card2 = if compare card1 card2 <= 0 then card1 else card2
  let max card1 card2 = if compare card1 card2 >= 0 then card1 else card2
  let best cards =
    match cards with
    | [] -> invalid_arg "empty list"
    | first :: rest ->
      List.fold_left max first rest

  let isOf (_, suit) target = suit = target
  let isSpade card = isOf card Suit.Spade
  let isHeart card = isOf card Suit.Heart
  let isDiamond card = isOf card Suit.Diamond
  let isClub card = isOf card Suit.Club
end

type t = Card.t list

let newDeck () =
  let rec pick_card i = function
    | [] -> assert false
    | x :: xs ->
        if i = 0 then (x, xs)
        else
          let (y, rest) = pick_card (i - 1) xs in
          (y, x :: rest)
  in
  let rec shuffle acc n deck =
    if n = 0 then acc
    else
      let (card, rest) = pick_card (Random.int n) deck in
      shuffle (card :: acc) (n - 1) rest
  in
  shuffle [] 52 Card.all

let toStringList deck =
  List.map Card.toString deck

let toStringListVerbose deck =
  List.map Card.toStringVerbose deck

let drawCard = function
  | [] -> failwith "empty deck"
  | first :: rest -> (first, rest)


