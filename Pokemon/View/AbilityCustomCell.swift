//
//  AbilityCustomCell.swift
//  Pokemon
//
//  Created by Alan Silva on 08/06/22.
//

import UIKit

class AbilityCustomCell: UITableViewCell {

    @IBOutlet weak var abilityNameTextLabel: UILabel!
    @IBOutlet weak var descTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setUp (value: Ability) {
        self.abilityNameTextLabel.text = value.name.capitalized
               
        Controller().fetchPokemonAbility(value: value.url) { pokemonAbility, error in
            //self.descTextLabel.text = pokemonAbility.effect_entries[0].effect
            let ability = pokemonAbility.effect_entries
            
            for i in ability {
                if i.language.name == "en" {
                    self.descTextLabel.text = i.short_effect
                    self.descTextLabel.textColor = .white
                }
            }
        }
    }
    
}
