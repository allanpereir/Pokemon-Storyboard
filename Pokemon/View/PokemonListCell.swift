//
//  PokemonListCell.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import UIKit

class PokemonListCell: UITableViewCell {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var nameTextlabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUp(value: Pokemon){
        self.nameTextlabel.text = value.name
    }
    
}
