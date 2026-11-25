module App : sig
  type project = string * string * int

  val zero : project
  val combine : project -> project -> project
  val fail : project -> project
  val success : project -> project
end = struct
  type project = string * string * int

  let zero : project = ("", "", 0)

  let combine ((name1, _, grade1) : project) ((name2, _, grade2) : project) : project =
    let grade = (grade1 + grade2) / 2 in
    (name1 ^ name2, (if grade >= 80 then "succeed" else "failed"), grade)

  let fail ((name, _, _) : project) : project =
    (name, "failed", 0)

  let success ((name, _, _) : project) : project =
    (name, "succeed", 80)
end

(* ────── Tests ────── *)

let print_proj ((name, status, grade) : App.project) =
  print_string ("(\"" ^ name ^ "\", \"" ^ status ^ "\", " ^ string_of_int grade ^ ")")

let print_combine first second =
  print_proj first;
  print_string " + ";
  print_proj second ;
  print_string " = ";
  print_proj (App.combine first second);
  print_newline ()

let () =
  print_endline "\x1b[4;37mApp:\x1b[0m";
  let first : App.project = ("first", "failed", 3)
  and second : App.project = ("second", "succeed", 81)
  in
  print_combine first second;
  print_combine App.zero (App.fail App.zero);
  print_combine App.zero (App.success App.zero);
