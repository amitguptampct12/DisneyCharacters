//
//  HTTP.swift
//  DogFacts
//
//  Created by Amit Gupta on 14/12/24.
//
import Foundation
/*
 Enumaration defined for capturing Network errors
 */
enum NetworkError: Error{
    case noInternet
    case timeOut
    case serverError
    case badURL
}

final class HttpUtility {
    
    static let shared = HttpUtility()
    private init(){}
    
    func getData(url: URL, completionHandler:@escaping(Result<Data, NetworkError>)-> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completionHandler(.failure(.serverError))
                return
            }
            guard let responseData = data else {
                completionHandler(.failure(.serverError))
                return
            }
            completionHandler(.success(responseData))
        }.resume()
    }
}
