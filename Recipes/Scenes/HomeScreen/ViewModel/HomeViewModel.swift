//
//  HomeViewModel.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation
import Combine

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
}

protocol HomeViewModelProtocol {
    var input: HomeViewModel.Input { get }
    var output: HomeViewModel.Output { get }
    func viewModelDidload()
}

enum ViewStates {
    case showHud
    case stopHud
}

class HomeViewModel: ObservableObject, HomeViewModelProtocol, ViewModelType {
  
    class Input {
        var searchPublisher: PassthroughSubject<String, Never> = .init()
    }
   
    class Output {
        var recipes: CurrentValueSubject<[RecipesModelElement], Never> = .init([])
        var viewStatesPublisher: PassthroughSubject<ViewStates, Never> = .init()
    }
    
    let input: Input = .init()
    let output: Output = .init()
    private let homeRepositery: HomeRepsiteryProtocol
    
    init(homeRepositery: HomeRepsiteryProtocol) {
        self.homeRepositery = homeRepositery
    }
    
    
    func viewModelDidload() {
        homeRepositery.getRecipes { [weak self] receipes in
            guard let self = self else {return}
            self.output.recipes.value = receipes
        }
    }
   
    
}
