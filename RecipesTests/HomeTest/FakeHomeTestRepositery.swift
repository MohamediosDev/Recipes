//
//  FakeHomeTestRepositery.swift
//  RecipesTests
//
//  Created by Mohamed sayed on 27/06/2023.
//

import Foundation

@testable import Recipes

class FakeHomeRepositery: HomeRepsiteryProtocol {
    
    
    
    var testCaseState: ResultStates = .success
    
    func setTestCaseState(testCaseState: ResultStates) {
        self.testCaseState = testCaseState
    }
    
    func getRecipes(complation: @escaping (Result<[Recipes.RecipesModelElement], Error>) -> Void) {
        switch testCaseState {
        case .success:
            complation(.success([RecipesModelElement(id: "12", fats: "3", name: "Meat", time: "11:23", image: "Ss", weeks: [""], carbos: "24", fibers: "rdd", rating: 0.5, country: "EGY", ratings: 90, calories: "100", headline: "MILK", keywords: ["sss"], products: ["Sss"], proteins: "13", favorites: 09, difficulty: 10, description: "Very Goo Meat", highlighted: true, ingredients: ["sss"], deliverableIngredients: ["dd"])]))
        case .fail:
            complation(.failure(NSError(domain: "", code: 404)))

        }
    }
//    func getRecipes(complation: @escaping ([RecipesModelElement]) -> Void) {
//
//    }
}


enum ResultStates {
    case success
    case fail
}
