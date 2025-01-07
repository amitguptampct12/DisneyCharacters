//
//  HTTP.swift
//  DogFacts
//
//  Created by Amit Gupta on 14/12/24.
//
import Foundation
import Combine
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
    
    private var cancellables = Set<AnyCancellable>()
    func getData(url: URL, completionHandler:@escaping(Result<DisneyResponse, NetworkError>)-> Void) {
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: DisneyResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                        completionHandler(.failure(.serverError))
                    case .finished:
                        break
                    }
                }, receiveValue: { users in
                    completionHandler(.success(users))
                })
                .store(in: &cancellables)
        }
}
