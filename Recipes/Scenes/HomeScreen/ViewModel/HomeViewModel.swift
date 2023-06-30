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
    func getRecipes()
    func filterRecipes()
}

enum ViewStates {
    case showHud
    case stopHud
}

class HomeViewModel: ObservableObject, HomeViewModelProtocol, ViewModelType {
  
    class Input {
        var searchPublisher: CurrentValueSubject<String, Never> = .init("")
    }
   
    class Output {
        var recipes: CurrentValueSubject<[RecipesModelElement], Never> = .init([])
        @Published var filterRecipes: [RecipesModelElement] = []
        var viewStatesPublisher: PassthroughSubject<ViewStates, Never> = .init()
    }
    
    let input: Input = .init()
    let output: Output = .init()
    private let homeRepositery: HomeRepsiteryProtocol
    lazy var cancellable: Set<AnyCancellable> = {
       return Set<AnyCancellable>()
    }()
    init(homeRepositery: HomeRepsiteryProtocol) {
        self.homeRepositery = homeRepositery
    }
    
    func viewModelDidload() {
        output.viewStatesPublisher.send(.showHud)
        getRecipes()
        filterRecipes()
    }
     func getRecipes() {
        homeRepositery.getRecipes { [weak self] receipes in
            guard let self = self else {return}
            output.viewStatesPublisher.send(.stopHud)
            switch receipes {
            case .success(let recipesData):
                self.output.recipes.value = recipesData
            case .failure(let failure):
                print("Error",failure)
            }
        }
    }
   
    func filterRecipes() {
        Publishers.CombineLatest(input.searchPublisher.eraseToAnyPublisher(), output.recipes.eraseToAnyPublisher()).map { searchText , respices in
            if searchText.isEmpty {
                return respices
            }
            return respices.filter { $0.name.lowercased().hasPrefix(searchText.lowercased())}
        }.sink {[weak self] filterRecipe in
            guard let self = self else {return}
            self.output.filterRecipes = filterRecipe
        }.store(in: &cancellable)
    }
    
}
