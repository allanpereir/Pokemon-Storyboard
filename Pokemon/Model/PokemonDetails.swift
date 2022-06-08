//
//  PokemonData.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import Foundation

struct PokemonDetails: Codable {
    var PokemonImages: PokemonImage
    var PokemonTypes: PokemonType
}

struct PokemonImage: Codable {
    var front_default: String?
}

struct PokemonType: Codable {
    var type: type
}

struct type: Codable {
    var name: String
    var url: String
}



