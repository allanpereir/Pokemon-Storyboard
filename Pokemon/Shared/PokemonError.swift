//
//  PokemonError.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation

enum PokemonError: Error {
    case networkError
    case decodeError
}

extension PokemonError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Desculpe, ocorreu um erro ao conectar aos servidores."
        case .decodeError:
            return "Desculpe, algo deu errado."
        }
    }
}

