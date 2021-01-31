//
//  ServiceAPI.swift
//  TheMovieApp
//
//  Created by CİHAN ÖZTÜRK on 29.01.2021.
//  Copyright © 2021 CİHAN ÖZTÜRK. All rights reserved.
//

import Foundation

protocol BaseRequest: Codable {
    var requestURL: String { get set }
}

final class ServiceAPI: NSObject {
    
    static let shared: ServiceAPI = {
        let shared = ServiceAPI()
        return shared
    }()
    
    func callService<T: Codable>(request: BaseRequest, response: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: URL(string: request.requestURL)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in

            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                           
                           // Print out entire dictionary
                           print("convertedJsonIntoDict",convertedJsonIntoDict)
                           
                           // Get value by key
                           let userId = convertedJsonIntoDict["userId"]
                           print(userId ?? "userId could not be read")
                           
                       }
            } catch let error as NSError {
                       print(error.localizedDescription)
            }
                let result = Result {
                // You know you can call `decode` with it because it's Decodable
                try JSONDecoder().decode(T.self, from: data)
            }
            completion(result)
        }
        task.resume()
    }
    
    
//    func parseJSON<T>(data: Data) -> Codable {
//
//        var returnValue: Codable?
//        do {
//            returnValue = try JSONDecoder().decode(UserResponseModel.self, from: data)
//        } catch {
//            print("Error took place\(error.localizedDescription).")
//        }
//
//        return returnValue
//    }
}



/*
 do {
           if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                
                // Print out entire dictionary
                print("convertedJsonIntoDict",convertedJsonIntoDict)
                
                // Get value by key
                let userId = convertedJsonIntoDict["userId"]
                print(userId ?? "userId could not be read")
                
            }
 } catch let error as NSError {
            print(error.localizedDescription)
  }*/
