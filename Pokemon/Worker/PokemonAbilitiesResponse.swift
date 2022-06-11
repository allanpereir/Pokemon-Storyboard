//
//  PokemonAbilitiesResponse.swift
//  Pokemon
//
//  Created by Alan Silva on 08/06/22.
//

import Foundation

struct PokemonAbilitiesResponse: Decodable {
    
    let effect_entries: [PokemonAbilities]
    
}
