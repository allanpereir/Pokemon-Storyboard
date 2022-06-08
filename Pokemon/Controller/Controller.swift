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
    var sprites: PokemonSprites?
    
    // MARK: Privete Properties
    private let pokemonListWorker: PokemonListWorker
    private let pokemonImageWorker: PokemonImageWorker
   
    
    // MARK: Init
    init(){
        self.pokemonListWorker = PokemonListWorker()
        self.pokemonImageWorker = PokemonImageWorker()
    }
    
    func fetchPokemonList(completion: @escaping (Bool, Error?) ->Void){
        pokemonListWorker.fetchPokemonList { [unowned self] result in
            switch result {
            case .success(let response):
                arrayPokemonCharacter = response.results
                completion(true, nil)
            case .failure(_):
                //exibir erro
                break
            }
        }
    }
    
    func fetchPokemonImage(value: String, completion: @escaping (PokemonSprites, Error?) -> Void){
        pokemonImageWorker.fetchPokemonImage(value: value) { [unowned self] result in
            switch result {
            case .success(let response):
                 completion(response.sprites, nil)
            case .failure(_):
                break
            }
        }
    }
    
    func getPokemon(indexPath: IndexPath) -> Pokemon {
        return self.arrayPokemonCharacter[indexPath.row]
    }
    
    func getCount() -> Int {
        return self.arrayPokemonCharacter.count
    }
    
    func getPokemonSelected(value: Int) -> Pokemon {
        return self.arrayPokemonCharacter[value]
    }
}

