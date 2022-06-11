//
//  PokemonAbilities".swift
//  Pokemon
//
//  Created by Alan Silva on 08/06/22.
//

import Foundation

struct PokemonAbilities: Codable {
    var short_effect: String
    var language: Language
}

struct Language: Codable {
    var name: String
}
