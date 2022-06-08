//
//  PokemonImageWoker.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation

typealias PokemonDetailsResult = (Result<PokemonDetailsResponse, PokemonError>) -> Void

protocol PokemonDetailsWorkerProtocol {
    
    func fetchPokemonDetails(value: String, completion: @escaping PokemonDetailsResult)
    
}

class PokemonDetailsWorker: PokemonDetailsWorkerProtocol {
    
    func fetchPokemonDetails(value: String, completion: @escaping PokemonDetailsResult) {
        let url = value
        
        NetWorkManager.request(url: url) { result in
            completion(result)
        }
    }
}

