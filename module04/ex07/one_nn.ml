(* ────── Euclidian distance (eu_dist) ────── *)

let eu_dist a b =
  try
    let acc = ref 0.0 in
    Array.iter2 (fun x y -> acc := !acc +. (x -. y) ** 2.0) a b;
    Some (sqrt !acc)
  with _ -> prerr_endline "Error: input arrays have different lengths"; None

(* ────── CSV file parser (examples_of_file) ────── *)

let split_last l =
  match List.rev l with
  | [] -> assert false
  | [x] -> ([||], x)
  | last :: rest ->
    (Array.of_list (List.map float_of_string (List.rev rest)), last)

let read_file ic =
  let rec loop acc =
    match input_line ic with
    | line -> loop (split_last (String.split_on_char ',' line) :: acc)
    | exception End_of_file -> List.rev acc
  in loop []

let examples_of_file path =
  try
    let ic = open_in path in
    let lines = read_file ic in
    close_in ic;
    lines
  with _ -> prerr_endline ("Error: unable to open '" ^ path ^ "'"); []

(* ────── One Nearest Neighbor Algorithm (one_nn) ────── *)

type radar = float array * string

let one_nn data radar =
	let closest = ref "" in
	let radar_vector = fst radar in
  let rec loop smallest = function
  | [] -> ()
  | (x, status) :: xs ->
    (match eu_dist x radar_vector with
    | None -> ()
    | Some d ->
      if d < smallest then (
        closest := status;
        loop d xs
      )
      else loop smallest xs)
	in
  (match data with
  | [] -> prerr_endline "Error: empty dataset"
  | (x, _) :: _ ->
    match eu_dist x radar_vector with
    | None -> ()
    | Some d -> loop d data);
	!closest

(* ────── Tests ────── *)

let dataset_test () =
  print_endline "\x1b[4;37mone_nn:\x1b[0m";
	let training_data = examples_of_file "datasets/ionosphere.train.csv" in
	let testing_data = examples_of_file "datasets/ionosphere.test.csv" in
	let correct = ref 0 in
	List.iter (fun radar ->
		let actual = snd radar in
		let predicted = one_nn training_data radar in
		let ok = actual = predicted in
		if ok then incr correct;
		Printf.printf "actual = %-5s predicted = %-4s  %s\n"
			actual predicted
			(if ok then "\x1b[32mOK\x1b[0m" else "\x1b[31mKO\x1b[0m")
	) testing_data;
	Printf.printf "\naccuracy = %d/%d\n\n" !correct (List.length testing_data)

let manual_test () =
  print_endline "\x1b[4;37mone_nn (hardcoded):\x1b[0m";
  let training = [
    ([|1.0; 0.0|], "a");
    ([|0.0; 1.0|], "b");
    ([|5.0; 5.0|], "c");
  ] in
  let test vec expected =
    let predicted = one_nn training (vec, "") in
    let ok = predicted = expected in
    Printf.printf "expected = %-3s predicted = %-6s %s\n" expected predicted 
      (if ok then "\x1b[32mOK\x1b[0m" else "\x1b[31mKO\x1b[0m")
  in
  test [|0.99; 0.01|] "a";
  test [|0.01; 0.99|] "b";
  test [|4.99; 5.01|] "c"

let edge_test () =
  print_endline "\x1b[4;37mone_nn (edge cases):\x1b[0m";
  let training = [([|1.0; 0.0|], "a"); ([|0.0; 1.0|], "b")] in
  ignore (one_nn training ([||], ""));
  ignore (one_nn [] ([|1.0; 0.0|], ""))

let () =
	dataset_test ();
	manual_test ();
  edge_test ()
