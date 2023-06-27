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
    func viewModelDidload()
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
    
    func viewModelDidload() {
        print("")
        
    }
    
   
}
