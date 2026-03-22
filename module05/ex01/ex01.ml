module StringHashtbl = Hashtbl.Make(
  struct
    type t = string

    let equal a b =
      let a_len = String.length a in
      if a_len <> String.length b then false
      else
        let rec loop i =
          if i >= a_len then true
          else if String.get a i <> String.get b i then false
          else loop (i + 1)
        in
        loop 0

    let hash = Hashtbl.hash
  end
)

let () =
  print_endline "\x1b[4;37mHashtbl functor:\x1b[0m";
  let ht = StringHashtbl.create 5 in
  let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
  let pairs = List.map (fun s-> (s, String.length s)) values in
  List.iter (fun (k,v)-> StringHashtbl.add ht k v) pairs;
  StringHashtbl.iter (fun k v-> Printf.printf "k = \"%s\", v = %d\n" k v) ht
