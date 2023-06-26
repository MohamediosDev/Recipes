//
//  NetworkHandler.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation


class NetworkHandler {

    static let shared = NetworkHandler()
    
    func fetch<T: Codable>(url: String, modelType: T.Type, complation: @escaping(Result<T, Error>) -> Void) {
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error In Network", error.localizedDescription)
            }
            guard let data = data else { return }
            
            do {
                let values = try JSONDecoder().decode(modelType.self, from: data)
                complation(.success(values))
            } catch {
                complation(.failure(error))
            }
        }.resume()
    }
}
