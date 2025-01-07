//
//  RestAPIWrapper.swift
//  DogFacts
//
//  Created by Amit Gupta on 14/12/24.
//
import Foundation
/*
 REST API common method
 params : URL
 return : A completion closure which contain Response and error
 */

protocol HTTPService {
    func getCharacters(rawUrl: String, completionHandler:@escaping(_ result: DisneyResponse?, _ error: NetworkError?)->Void)
}

struct RestAPIWrapper : HTTPService {
    func getCharacters(rawUrl: String, completionHandler:@escaping(_ result: DisneyResponse?, _ error: NetworkError?)->Void) {
        if let url = URL(string: rawUrl){
            HttpUtility.shared.getData(url: url) { response in
                switch(response){
                case.success(let data):
                    completionHandler(data, nil)
                case.failure(let error):
                    completionHandler(nil, error)
                }
            }
        } else {
            completionHandler(nil,NetworkError.badURL)
        }
    }
}
