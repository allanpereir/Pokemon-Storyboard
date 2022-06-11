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
    @IBOutlet weak var abilityTableView: UITableView!
    
    var pokemonSelected: Pokemon?
    var pokemonDetails: PokemonDetailsResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.abilityTableView.delegate = self
        self.abilityTableView.dataSource = self
        self.abilityTableView.register(UINib(nibName: "AbilityCustomCell", bundle: nil), forCellReuseIdentifier: "AbilityCustomCell")
        
        let imageLink = pokemonSelected?.url
        
        Controller().fetchPokemonDetails(value: imageLink!) { pokemonResult, error in
            self.pokemonDetails = pokemonResult
            self.setUP()
        }
        
    }
    
    func setUP() {
        self.pokemonName.text = pokemonSelected?.name.capitalized
        self.imagePokemon.sd_setImage(with: URL(string: pokemonDetails?.sprites.front_default ?? ""), completed: nil)
        
        self.abilityTableView.reloadData()
    }
    
    func getCount() -> Int {
        return pokemonDetails?.abilities.count ?? 0
    }

}
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AbilityCustomCell? = abilityTableView.dequeueReusableCell(withIdentifier: "AbilityCustomCell", for: indexPath) as? AbilityCustomCell
        cell?.setUp(value: pokemonDetails?.abilities[indexPath.row].ability ?? Ability.init(name: "", url: ""))
        return cell ?? UITableViewCell()
    }
    
}
