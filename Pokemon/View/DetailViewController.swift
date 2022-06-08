//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Alan Silva on 05/06/22.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    var pokemonSelected: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pokemonName.text = pokemonSelected?.name.capitalized
        
        let imageLink = pokemonSelected?.url
        
        if imageLink != nil {
            getPokemonImage(url: imageLink!)
        }
    }
    func getPokemonImage(url: String) {
        var tempSprite: String?

        /*
        PokemonSelectedApi().getData(url: url) { sprite  in
            tempSprite = sprite.front_default
            self.imagePokemon.sd_setImage(with: URL(string: tempSprite ?? ""), completed: nil)
        }
         */
    }

}
