//
//  LoginUniteTest.swift
//  RecipesTests
//
//  Created by Mohamed sayed on 27/06/2023.
//

import XCTest
@testable import Recipes

final class LoginUniteTest: XCTestCase {

    private let saveEmail = UserDefaults.standard.string(forKey: "#EMAIL")
    private let savepass = UserDefaults.standard.string(forKey: "#PASS")
    
    func testLoginUser_WithValidEmail_ShouldReturnTrue() {
        let email = "Soda@Brightskies.com"
        XCTAssertEqual(saveEmail ,email)
    }
    
    func testLoginUser_WithInValidEmail_ShoudReturnFalse() {
        let email = "Sodaa@Brightskies.com"
        XCTAssertTrue(saveEmail != email)
    }
    
    func testLoginUser_WithValidPass_ShouldReturnTrue() {
        let pass = "12345678"
        XCTAssertEqual(savepass, pass)
    }
    
    func testLoginUser_WithInValidPass_ShouldReturnNotEqual() {
        let pass = "123456789"
        XCTAssertNotEqual(savepass, pass)
    }
}
