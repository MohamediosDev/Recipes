//
//  RecupesDetailViewModel.swift
//  Recipes
//
//  Created by Mohamed sayed on 27/06/2023.
//

import Foundation

protocol ReceipesDetailViewModelProtocol {
    var input: ReceipesDetailViewModel.Input { get }
    var output: ReceipesDetailViewModel.Output { get }
    func addRecipesToFavourtie(isFavourite: Bool)
    func getFavourtiesData() -> Bool 
}

class ReceipesDetailViewModel : ObservableObject , ReceipesDetailViewModelProtocol , ViewModelType {
    
    class Input {
        
    }
    
    class Output {
        @Published var recepieDetail: RecipesModelElement?
    }
    
    private let realmManager: DataBaseManagerProtocol = DataBaseManager()
    let input: Input = .init()
    let output: Output = .init()
      
    init(recipesDetail: RecipesModelElement) {
        self.output.recepieDetail = recipesDetail
    }
    
    func addRecipesToFavourtie(isFavourite: Bool) {
        guard let recipes = output.recepieDetail else {return}
        if let saveRecipe = realmManager.getFavourtie(recipes.id) {
            realmManager.deletFavourite(recipe: saveRecipe)
            let newRecipe = recipes.toDataBase(isFavourite: isFavourite)
            realmManager.saveFavouriteState(recipe: newRecipe)
        } else {
            realmManager.saveFavouriteState(recipe: recipes.toDataBase(isFavourite: isFavourite))
        }
    }
    
    func getFavourtiesData() -> Bool {
        guard let recipes = output.recepieDetail else {return false}
        guard let saveRecipe = realmManager.getFavourtie(recipes.id) else { return false}
        
        return saveRecipe.isFavourite
    }

}
