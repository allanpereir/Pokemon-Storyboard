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
    
    var imageLink = ""
    var pokemonSprite = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setUp(value: Pokemon) {
        self.nameTextlabel.text = value.name.capitalized
        imageLink = value.url
        
        Controller().fetchPokemonImage(value: value.url) { Pokemon, error in
            self.imageCharacter.sd_setImage(with: URL(string: Pokemon.front_default), completed: nil)
            
        }
    }
}
