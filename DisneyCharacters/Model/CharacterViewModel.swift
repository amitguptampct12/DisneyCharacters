//
//  DogFactViewModel.swift
//  DogFacts
//
//  Created by Amit Gupta on 15/12/24.
//
import SwiftUI

class CharacterViewModel : ObservableObject {
    
    @Published var disneyResponse: DisneyResponse?
    @Published var showLoadingIndicator : Bool = true
    private let apiWrapper : RestAPIWrapper = RestAPIWrapper()
    
    func fetchCharacters() {
        apiWrapper.getCharactors(rawUrl: getCharacterAPI) { response,error  in
            DispatchQueue.main.async {
                self.showLoadingIndicator = false
                if (error != nil){
                    switch(error){
                    case .noInternet:
                        print("Network error!")
                    case .timeOut:
                        print("Request timeout error!")
                    case .serverError:
                        print("")
                    case .badURL:
                        print("Malformed URL error!")
                    case .none:
                        print("Generic error!")
                    }
                }else{
                    self.disneyResponse = response
                }
            }
        }
    }
}
