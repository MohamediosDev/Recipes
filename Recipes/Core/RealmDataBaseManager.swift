//
//  RealmDataBaseManager.swift
//  Recipes
//
//  Created by Mohamed sayed on 30/06/2023.
//

import Foundation
import RealmSwift

protocol DataBaseManagerProtocol {
    func saveFavouriteState(recipe: RecipesDataBaseModel)
    func getFavourtie(_ id: String) -> RecipesDataBaseModel?
    func deletFavourite(recipe: RecipesDataBaseModel)
}

final class DataBaseManager: DataBaseManagerProtocol {
    
    private let realm = try! Realm()
    
    func saveFavouriteState(recipe: RecipesDataBaseModel) {
        do {
            try realm.write {
                realm.add(recipe)
                print("Item Saved", recipe)
            }
        } catch {
            print("Error In Save In DataBase \(error.localizedDescription)")
        }
    }
    
    func getFavourtie(_ id: String) -> RecipesDataBaseModel? {
        return realm.objects(RecipesDataBaseModel.self).filter { $0.id == id }.first
    }
    
    func deletFavourite(recipe: RecipesDataBaseModel) {
        do {
            try realm.write {
                realm.delete(recipe)
            }
        } catch {
            print("Error In removeFav In DataBase \(error.localizedDescription)")
        }
    }
}
