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
        // Initialization code
    }
    
    func setUp(value: Pokemon) {
           
        self.nameTextlabel.text = value.name.capitalized
        imageLink = value.url
        
        let loadedData = UserDefaults.standard.string(forKey: imageLink)
        
        if loadedData == nil {
            getPokemonImage(url: imageLink)
            UserDefaults.standard.set(imageLink, forKey: imageLink)
            print("New url!! Caching..")
        } else {
            getPokemonImage(url: loadedData!)
            print("Using Caching")
        }
    }
    
    func getPokemonImage(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getData(url: url) { sprite  in
            tempSprite = sprite.front_default
            self.imageCharacter.sd_setImage(with: URL(string: tempSprite ?? ""), completed: nil)
        }
    }
}
