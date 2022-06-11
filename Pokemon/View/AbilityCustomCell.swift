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
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    var pokemonSameAbility: [PokemonSameAbitity] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.pokemonCollection.delegate = self
        self.pokemonCollection.dataSource =  self
        self.pokemonCollection.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCollectionViewCell")
    }
    
    func setUp (value: Ability) {
        
        self.abilityNameTextLabel.text = value.name.capitalized
               
        Controller().fetchPokemonAbility(value: value.url) { pokemonAbility, error in
            let ability = pokemonAbility.effect_entries
            self.pokemonSameAbility = pokemonAbility.pokemon
            self.pokemonCollection.reloadData()
            
            for i in ability {
                if i.language.name == "en" {
                    self.descTextLabel.text = i.short_effect
                    self.descTextLabel.textColor = .white
                }
            }
        }
    }
}
extension AbilityCustomCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return pokemonSameAbility.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection: PokemonCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell
        collection?.setup(value: pokemonSameAbility[indexPath.row].pokemon)
        return collection ?? UICollectionViewCell()
    }
}
