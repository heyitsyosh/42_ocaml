(* ────── Euclidian distance (eu_dist) ────── *)

let eu_dist a b =
  if Array.length a <> Array.length b then
    failwith "Different dimensions"
	else
    let acc = ref 0.0 in
    Array.iter2 (fun x y -> acc := !acc +. (x -. y) ** 2.0) a b;
    sqrt !acc

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

(* ────── K-Nearest Neighbor Algorithm (k_nn) ────── *)

type radar = float array * string

let take n l =
  let rec loop i acc = function
    | x :: xs when i < n -> loop (i + 1) (x :: acc) xs
    | _ -> List.rev acc
  in
  if n <= 0 then [] else loop 0 [] l

let count_majority k_labels =
  let tbl = Hashtbl.create (List.length k_labels) in
  List.iter (fun label ->
    let n = match Hashtbl.find_opt tbl label with
		| Some x -> x
		| None -> 0
		in
    Hashtbl.replace tbl label (n + 1)
  ) k_labels;
  Hashtbl.fold (fun k v (bk, bv) ->
		if v > bv then (k, v)
		else (bk, bv)
		) tbl ("", 0) |> fst

let k_nn data k radar =
	let radar_vec = fst radar in
	let distances =
		List.map (fun x ->
			let dist = eu_dist (fst x) radar_vec in
			(dist, snd x)
			) data in
	let sorted_distances =
		List.fast_sort (fun a b -> compare (fst a) (fst b)) distances in
	let k_lables = List.map snd @@ take k sorted_distances in
	count_majority k_lables

(* ────── Tests ────── *)

let test k testing_data training_data =
	let correct = ref 0 in
	List.iter (fun radar ->
		if snd radar = k_nn training_data k radar then incr correct) testing_data;
	Printf.printf "k=%3d accuracy = %d/%d\n" k !correct (List.length testing_data)

let () =
  print_endline "\x1b[4;37mk_nn:\x1b[0m";
	let testing_data = examples_of_file "datasets/ionosphere.test.csv" in
	let training_data = examples_of_file "datasets/ionosphere.train.csv" in
	test (-1) testing_data training_data;
	test 1 testing_data training_data;
	test 5 testing_data training_data;
	test 10 testing_data training_data;
	test 50 testing_data training_data;
	test 70 testing_data training_data;
	test 100 testing_data training_data
