class water =
  object
    inherit Molecule_base.molecule
      "Water" [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen]
  end

class carbon_dioxide =
  object
    inherit Molecule_base.molecule
      "Carbon dioxide" [new Atom.carbon; new Atom.oxygen; new Atom.oxygen]
  end

class ammonia =
  object
    inherit Molecule_base.molecule
      "Ammonia" [new Atom.nitrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen]
  end

class methane =
  object
    inherit Molecule_base.molecule
      "Methane" [new Atom.carbon; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen]
  end

class sulfur_dioxide =
  object
    inherit Molecule_base.molecule
      "Sulfur dioxide" [new Atom.sulfur; new Atom.oxygen; new Atom.oxygen]
  end
