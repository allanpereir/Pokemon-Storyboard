//
//  PokemonAPI.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation

struct PokemonAPI {
    static let baseURL: String = "https://pokeapi.co/api/v2/pokemon/?limit=151"
    
    static func buildList() -> String {
        return baseURL
    }
}
