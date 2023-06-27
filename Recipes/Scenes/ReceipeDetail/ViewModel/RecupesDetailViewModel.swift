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
    
    let input: Input = .init()
    let output: Output = .init()
      
    init(recipesDetail: RecipesModelElement) {
        self.output.recepieDetail = recipesDetail
    }
    
    func addRecipesToFavourtie(isFavourite: Bool) {
        UserDefaults.standard.set(isFavourite, forKey: output.recepieDetail?.id ?? "NOID")
        UserDefaults.standard.synchronize()
    }
    
    func getFavourtiesData() -> Bool {
        return UserDefaults.standard.value(forKey: output.recepieDetail?.id ?? "NOID") as? Bool ?? false
    }

}
