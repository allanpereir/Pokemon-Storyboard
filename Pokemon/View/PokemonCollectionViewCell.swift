//
//  PokemonCollectionViewCell.swift
//  Pokemon
//
//  Created by Alan Silva on 10/06/22.
//

import UIKit
import SDWebImage

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var pokemonNameTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 0.3 * self.bounds.size.width
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.purple.cgColor
        self.layer.borderWidth = 1.9
    }
    
    func setup(value: Pokemons) {
        
        self.pokemonNameTextLabel.text = value.name.capitalized
        
        Controller().fetchPokemonDetails(value: value.url) { pokemonReturn, error in
            self.imagePokemon.sd_setImage(with: URL(string: pokemonReturn.sprites.front_default ?? ""), completed: nil)
            
        }
        
    }

}
