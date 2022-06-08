//
//  PokemonImageWoker.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation

typealias PokemonImageResult = (Result<PokemonImageResponse, PokemonError>) -> Void

protocol PokemonImageWorkerProtocol {
    
    func fetchPokemonImage(value: String, completion: @escaping PokemonImageResult)
    
}

class PokemonImageWorker: PokemonImageWorkerProtocol {
    
    func fetchPokemonImage(value: String, completion: @escaping PokemonImageResult) {
        let url = value
        
        NetWorkManager.request(url: url) { result in
            completion(result)
        }
    }
}

