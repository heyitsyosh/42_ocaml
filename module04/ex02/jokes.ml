let () =
  let jokes = [|
    "What do you call a deer with no eyes? No eye deer.";
    "What's brown and sticky? A stick!";
    "What do you call a fake noodle? An impasta.";
    "Quel est le comble pour un électricien ? De ne pas être au courant.";
    "Comment appelle-t-on un chien sans pattes ?  On ne l'appelle pas, on va le chercher.";
    "Que dit un chat qui entre dans une pharmacie ? Bonjour, vous auriez un sirop pour matou ?"
  |]
  in
  let file = open_in "/dev/urandom" in
  let seed = input_binary_int file in
  close_in file;
  let i = abs seed mod 6 in
    print_endline jokes.(i);
