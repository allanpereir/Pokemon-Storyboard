//
//  PokemonListWorker.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation

typealias PokemonListResult = (Result<PokemonListResponse, PokemonError>) -> Void

protocol PokemonWorkerProtocol {
    
    func fetchPokemonList(completion: @escaping PokemonListResult)
    
}

class PokemonListWorker: PokemonWorkerProtocol {
    
    func fetchPokemonList(completion: @escaping PokemonListResult) {
        let url = PokemonAPI.buildList()
        
        NetWorkManager.request(url: url) { result in
            completion(result)
        }
    }
}
