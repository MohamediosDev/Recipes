//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Mohamed sayed on 26/06/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    init () {
        UserDefaults.standard.set("Soda@Brightskies.com", forKey: "#EMAIL")
        UserDefaults.standard.set("12345678", forKey: "#PASS")
    }
    
    func userLogin(email: String, pass: String , complation: @escaping (Result<String,Error>) -> Void) {
        let savedEmail = UserDefaults.standard.string(forKey: "#EMAIL")
        let savedPass = UserDefaults.standard.string(forKey: "#PASS")

        if savedEmail == email && savedPass == pass {
            print("We Are Login")
            complation(.success("Welcome,Back Soda"))
        } else {
            complation(.failure(NSError()))
        }
    }
}
