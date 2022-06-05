//
//  PokemonData.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import Foundation

struct Sprites: Codable {
    var other: OfficialArtwork
}

struct OfficialArtwork: Codable {
    var front_default: String
}


