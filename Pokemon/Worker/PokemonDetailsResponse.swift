//
//  PokemonImageResponse.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation

struct PokemonDetailsResponse: Decodable {
    
    let sprites: PokemonImage
    let types: [PokemonType]
    
}
