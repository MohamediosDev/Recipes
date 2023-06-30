//
//  Constant.swift
//  Network layer
//
//  Created by Soda on 6/10/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
struct NetworkBaseUrl {
    
static let baseURL = "https://api.npoint.io"
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
    
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:[String:Any])
    case url(_:[String:Any])
    case noParamter
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    // implement more when needed: post, put, delete, patch, etc.
}
