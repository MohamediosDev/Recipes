//
//  HomeViewModelTest.swift
//  RecipesTests
//
//  Created by Mohamed sayed on 27/06/2023.
//

import XCTest
import Combine
@testable import Recipes

final class HomeViewModelTest: XCTestCase {

    var viewModel: HomeViewModelProtocol!
    var fakeHomeRepo: FakeHomeRepositery!
    var cancelable = Set<AnyCancellable>()
    override func setUpWithError() throws {
        fakeHomeRepo = FakeHomeRepositery()
        viewModel = HomeViewModel(homeRepositery: fakeHomeRepo)
    }

    
    func testGetAllRecipesData_WithValidData_ShouldReturnData() {
        let expection = XCTestExpectation(description: "Get All Recipes Data")
        var recipesData: [RecipesModelElement] = []
        viewModel.output.recipes.sink { recipes in
            recipesData = recipes
            expection.fulfill()
        }.store(in: &cancelable)
        viewModel.getRecipes()
        wait(for: [expection] , timeout: 5)
        XCTAssertTrue(!recipesData.isEmpty)
    }
    
    func testGetAllRecipesData_WithInValidData_ShouldReturnEmpty() {
        let expection = XCTestExpectation(description: "Get All Recipes Data")
        var recipesData: [RecipesModelElement] = []
        fakeHomeRepo.setTestCaseState(testCaseState: .fail)
        viewModel.output.recipes.sink { recipes in
            recipesData = recipes
            expection.fulfill()
        }.store(in: &cancelable)
        viewModel.getRecipes()
        wait(for: [expection] , timeout: 5)
        XCTAssertTrue(recipesData.isEmpty)
    }
}
