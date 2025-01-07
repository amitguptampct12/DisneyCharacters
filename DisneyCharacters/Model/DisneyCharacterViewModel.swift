//
//  DogFactViewModel.swift
//  DogFacts
//
//  Created by Amit Gupta on 15/12/24.
//
import SwiftUI

@Observable class DisneyCharacterViewModel {
    
    var disneyResponse: DisneyResponse?
    var showLoadingIndicator : Bool = true
    private let apiWrapper : HTTPService
    
    init(apiWrapper : HTTPService){
        self.apiWrapper = apiWrapper
    }
    
    func fetchCharacters(url: String) {
        apiWrapper.getCharacters(rawUrl: url) { response,error  in
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
    
    /* Method accept a search term and characters collection, search it within collection of DisneyCharacter.
     Returns search result.
     */
     func search(for searchTerm: String, characters: [DisneyCharacter])-> [DisneyCharacter]{
        if searchTerm.isEmpty{
            return characters
        }else{
            return characters.filter{
                $0.name!.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    /* Method accept a boolean parameter and character collection.
     It sort characters alphabetically if param 'alphabetical' = true otherwise sort as per character id incrementally.
     */
     func sort(by alphabetical: Bool, characters: [DisneyCharacter])-> [DisneyCharacter] {
        var sortedCharacters = characters
        if alphabetical {
            sortedCharacters.sort{
                $0.name ?? "" < $1.name ?? ""
            }
        }else {
            sortedCharacters.sort{
                $0._id ?? 0 < $1._id ?? 0
            }
        }
        return sortedCharacters
    }
}
