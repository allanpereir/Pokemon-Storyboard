//
//  PokemonAbilitiesWorker.swift
//  Pokemon
//
//  Created by Alan Silva on 08/06/22.
//

import Foundation

typealias PokemonAbilitiesResult = (Result<PokemonAbilitiesResponse, PokemonError>) -> Void

protocol PokemonAbilitiesWorkerProtocol {
    
    func fetchPokemonAbility(value: String, completion: @escaping PokemonAbilitiesResult)
    
}
class PokemonAbilitiesWorker: PokemonAbilitiesWorkerProtocol {
    
    func fetchPokemonAbility(value: String, completion: @escaping PokemonAbilitiesResult) {
        let url = value
        NetWorkManager.request(url: url) { result in completion(result)
            
        }
    }
}
