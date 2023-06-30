//
//  HomeNetwork.swift
//  Recipes
//
//  Created by Mohamed sayed on 30/06/2023.
//

import Foundation

enum HomeEndPoint: String {
    case recipes = "/43427003d33f1f6b51cc"
}

enum HomeAPIRouter {
    case getRecipes
}

extension HomeAPIRouter: APIConfiguration {
    
    var baseURL: String {
        switch self {
        default:
            return NetworkBaseUrl.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getRecipes:
            return HomeEndPoint.recipes.rawValue
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getRecipes:
            return .noParamter
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRecipes:
            return .get
        }
    }
    
    var Header: [String : String] {
        switch self {
        case .getRecipes:
            return [:]
        }
    }
    
    
}
