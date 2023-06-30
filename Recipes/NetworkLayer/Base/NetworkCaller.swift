//
//  NetworkCaller.swift
//  Network layer
//
//  Created by Soda on 8/15/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Combine
class Network{
    class func Request<T:Codable>(request:URLRequest, completion: @escaping (Result<T,Error>) -> Void){
        
        let session = URLSession(configuration: .default)
        
        let RequesterTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {return}
            if let HTTPResponse = response as? HTTPURLResponse {
                
                switch HTTPResponse.statusCode {
                case 200..<300:
                    if let URLData = data {
                    do {
                    let ResponseResult = try JSONDecoder().decode(T.self, from: URLData)
                        completion(.success(ResponseResult))
                    }catch{
                        completion(.failure(error))
                    }
                    }
                case 400...500:
                    if let URLDataError = data {
                 print("Error In Response",URLDataError)
            }
                default:
                    print("")
                }
          
        }
        }
        RequesterTask.resume()
    }
}
