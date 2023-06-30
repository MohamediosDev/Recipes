//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    init () {
        UserDefaults.standard.set(Constants.userEmail, forKey: Constants.emailKey)
        UserDefaults.standard.set(Constants.userPassword, forKey: Constants.passKey)
    }
    
    func userLogin(email: String, pass: String , complation: @escaping (Result<String,Error>) -> Void) {
        let savedEmail = UserDefaults.standard.string(forKey: Constants.emailKey)
        let savedPass = UserDefaults.standard.string(forKey: Constants.passKey)

        if savedEmail == email && savedPass == pass {
            print("We Are Login")
            complation(.success("Welcome,Back Soda"))
        } else {
            complation(.failure(NSError()))
        }
    }
}
