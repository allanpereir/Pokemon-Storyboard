//
//  Controller.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import Foundation

class Controller {
    
    // MARK: Public Properties
    var arrayPokemonCharacter: [Pokemon] = []
    var arrayFilteredPokemonCharacter: [Pokemon] = []
    
    var sprites: PokemonImage?
    
    // MARK: Privete Properties
    private let pokemonListWorker: PokemonListWorker
    private let pokemonDetailsWorker: PokemonDetailsWorker
   
    
    // MARK: Init
    init(){
        self.pokemonListWorker = PokemonListWorker()
        self.pokemonDetailsWorker = PokemonDetailsWorker()
    }
    
    func fetchPokemonList(completion: @escaping (Bool, Error?) ->Void){
        pokemonListWorker.fetchPokemonList { [unowned self] result in
            switch result {
            case .success(let response):
                arrayPokemonCharacter = response.results
                arrayFilteredPokemonCharacter = arrayPokemonCharacter
                completion(true, nil)
            case .failure(_):
                //exibir erro
                break
            }
        }
    }
    
    func getFilteredPokemonList (searchText: String) {
        
        if searchText == "" {
            print("Entrei")
            arrayFilteredPokemonCharacter = arrayPokemonCharacter
        }else {
            arrayFilteredPokemonCharacter = arrayPokemonCharacter.filter { user -> Bool in return user.name.capitalized.contains(searchText)}
        }
    }
    
    func fetchPokemonDetails(value: String, completion: @escaping (PokemonDetailsResponse, Error?) -> Void){
        pokemonDetailsWorker.fetchPokemonDetails(value: value) { [unowned self] result in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(_):
                break
            }
        }
    }
    
    func getPokemon(indexPath: IndexPath) -> Pokemon {
        return self.arrayFilteredPokemonCharacter[indexPath.row]
    }
    
    func getCount() -> Int {
        return self.arrayFilteredPokemonCharacter.count
    }
    
    func getPokemonSelected(value: Int) -> Pokemon {
        return self.arrayFilteredPokemonCharacter[value]
    }
}

