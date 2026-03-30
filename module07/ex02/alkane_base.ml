class virtual alkane (n: int) =
  object (self)
    inherit Molecule_base.molecule
      ([|"Meth"; "Eth"; "Prop"; "But"; "Pent"; "Hex"; "Hept"; "Oct"; "Non"; "Dec";"Undec"; "Dodec"|].(n) ^ "ane")
      ((List.init (n + 1) (fun _ -> new Atom.carbon)) @ (List.init (2 * (n + 1) + 2) (fun _ -> new Atom.hydrogen)))
  end
