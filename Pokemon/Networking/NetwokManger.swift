//
//  NetwokManger.swift
//  Pokemon
//
//  Created by Alan Silva on 07/06/22.
//

import Foundation
typealias NetworkResult<T: Decodable> = ((Result<T, PokemonError>) -> Void)

protocol NetworkManagerProtocol {
    
    static func request <T: Decodable>(url: String, completion: @escaping NetworkResult<T>)
    
}

class NetWorkManager: NetworkManagerProtocol {
    
    static func request<T>(url: String, completion: @escaping NetworkResult<T>) where T : Decodable {
        
        guard let url = URL(string: url) else {
            return completion(.failure(.decodeError))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return completion(.failure(.decodeError))}
            
            let result = try! JSONDecoder().decode(T.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }.resume()
    }
}




