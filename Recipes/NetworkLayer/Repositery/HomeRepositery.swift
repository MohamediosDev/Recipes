//
//  HomeRepositery.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation
protocol HomeRepsiteryProtocol {
    func getRecipes(complation: @escaping([RecipesModelElement]) -> Void)
}

class HomeRepositery: HomeRepsiteryProtocol {
   
    private let network: NetworkHandler
    
    init(network: NetworkHandler) {
        self.network = network
    }
    
    func getRecipes(complation: @escaping ([RecipesModelElement]) -> Void) {
        network.fetch(url: "https://api.npoint.io/43427003d33f1f6b51cc", modelType: [RecipesModelElement].self) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let success):
                complation(success)
            case .failure(let failure):
                print("Error: ", failure)
            }
        }
    }
    
}
