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
   
    func getRecipes(complation: @escaping (Result<[RecipesModelElement], Error>) -> Void) {
        Network.Request(request: HomeAPIRouter.getRecipes.urlRequest, completion: complation)
    }
    
}
