//
//  PokemonListCell.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import UIKit
import SDWebImage

class PokemonListCell: UITableViewCell {
    
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var nameTextlabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var typeTextLabel: UILabel!
    
    var imageLink = ""
    var pokemonSprite = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setUp(value: Pokemon) {
        self.nameTextlabel.text = value.name.capitalized
        imageLink = value.url
        
        
        Controller().fetchPokemonDetails(value: value.url) { Pokemon, error in
            self.imageCharacter.sd_setImage(with: URL(string: Pokemon.sprites.front_default ?? ""), completed: nil)
            
            var type = ""
            for i in 1...Pokemon.types.count {
                type = type + (Pokemon.types[i - 1].type.name)
                
                if i > 0 {
                    type = type + ","
                }
            }
            self.typeTextLabel.text = type.capitalized
            
        }
    }
}
