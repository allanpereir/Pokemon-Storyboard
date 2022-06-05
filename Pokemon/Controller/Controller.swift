//
//  Controller.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import Foundation

class PokemonApi {
    
    var arrayPokemonCharacter: [Pokemon] = []
    
    func getData(completion: @escaping ([Pokemon]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(APICharacterData.self, from: data)
            
            DispatchQueue.main.async {
                self.arrayPokemonCharacter = pokemonList.results
                completion(pokemonList.results)
            }
        }.resume()
    }
    
    func getPokemon(indexPath: IndexPath) -> Pokemon {
        return self.arrayPokemonCharacter[indexPath.row]
    }
    
    func getCount() -> Int {
        return self.arrayPokemonCharacter.count
    }
}

