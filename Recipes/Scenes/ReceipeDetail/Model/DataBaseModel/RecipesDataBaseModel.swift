//
//  RecipesDataBaseModel.swift
//  Recipes
//
//  Created by Mohamed sayed on 30/06/2023.
//

import Foundation
import RealmSwift

class RecipesDataBaseModel: Object {
    @Persisted var id: String
    @Persisted var isFavourite: Bool
}
