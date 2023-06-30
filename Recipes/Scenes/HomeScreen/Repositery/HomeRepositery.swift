//
//  HomeRepositery.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation
protocol HomeRepsiteryProtocol {
    func getRecipes(complation: @escaping (Result<[RecipesModelElement], Error>) -> Void)
}

class HomeRepositery: HomeRepsiteryProtocol {
   
    private let network: NetworkHandler
    
    init(network: NetworkHandler) {
        self.network = network
    }
    
    func getRecipes(complation: @escaping (Result<[RecipesModelElement], Error>) -> Void) {
        Network.Request(request: HomeAPIRouter.getRecipes.urlRequest, completion: complation)
    }
    
}
