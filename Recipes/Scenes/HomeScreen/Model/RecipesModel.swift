//
//  RecipesModel.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//
import Foundation

// MARK: - RecipesModelElement
struct RecipesModelElement: Codable {
    let id, fats, name, time: String
    let image: String
    let weeks: [String]
    let carbos, fibers: String
    let rating: Double?
    let country: String
    let ratings: Int?
    let calories, headline: String
    let keywords, products: [String]
    let proteins: String
    let favorites, difficulty: Int
    let description: String
    let highlighted: Bool
    let ingredients: [String]
    let deliverableIngredients: [String]

    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, rating, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty, description, highlighted, ingredients
        case deliverableIngredients = "deliverable_ingredients"
    }
}

extension RecipesModelElement {
    func toDataBase(isFavourite: Bool) -> RecipesDataBaseModel {
        let dataBaseModel = RecipesDataBaseModel()
        dataBaseModel.id = self.id
        dataBaseModel.isFavourite = isFavourite
        return dataBaseModel
    }
}


