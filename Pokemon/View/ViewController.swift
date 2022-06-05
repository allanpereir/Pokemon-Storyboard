//
//  ViewController.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let pokemonApi = PokemonApi()
  
    @IBOutlet weak var characterSearchBar: UISearchBar!
    @IBOutlet weak var characterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterTableView.dataSource = self
        self.characterTableView.delegate = self
        self.characterTableView.register(UINib(nibName: "PokemonListCell", bundle: nil), forCellReuseIdentifier: "PokemonListCell")
        
        pokemonApi.getData { pokemon in
            self.characterTableView.reloadData()
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonApi.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListCell? = characterTableView.dequeueReusableCell(withIdentifier: "PokemonListCell", for: indexPath) as! PokemonListCell
        
        cell?.setUp(value: pokemonApi.getPokemon(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pokemon = pokemonApi.getPokemonSelected(value: indexPath.row)
        print(pokemon.name.capitalized)
        performSegue(withIdentifier: "DetailViewController", sender: pokemon)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController: DetailViewController? = segue.destination as? DetailViewController
        detailViewController?.pokemonSelected = sender as? Pokemon
    }
    
}


