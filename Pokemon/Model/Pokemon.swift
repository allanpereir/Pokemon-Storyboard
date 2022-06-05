//
//  Character.swift
//  Pokemon
//
//  Created by Alan Silva on 04/06/22.
//

import Foundation

struct APICharacterData: Codable {
    var count: Int
    var next: String
    var results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    var url: String
}







