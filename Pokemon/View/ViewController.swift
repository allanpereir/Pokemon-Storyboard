//
//  ViewController.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let controller = Controller()
  
    @IBOutlet weak var characterSearchBar: UISearchBar!
    @IBOutlet weak var characterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterTableView.dataSource = self
        self.characterTableView.delegate = self
        self.characterSearchBar.delegate = self
        
        self.characterTableView.register(UINib(nibName: K.pokemonListCell, bundle: nil), forCellReuseIdentifier: K.pokemonListCell)
        
        controller.fetchPokemonList { pokemon, error in
            self.characterTableView.reloadData()
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListCell? = characterTableView.dequeueReusableCell(withIdentifier: K.pokemonListCell, for: indexPath) as! PokemonListCell
        
        cell?.setUp(value: controller.getPokemon(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pokemon = controller.getPokemonSelected(value: indexPath.row)
        performSegue(withIdentifier: K.detailViewController, sender: pokemon)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController: DetailViewController? = segue.destination as? DetailViewController
        detailViewController?.pokemonSelected = sender as? Pokemon
    }
}
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            controller.getFilteredPokemonList(searchText: characterSearchBar.text!)
            self.characterTableView.reloadData()
    }
}


