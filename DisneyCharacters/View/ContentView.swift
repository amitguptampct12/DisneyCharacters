//
//  ContentView.swift
//  DogFacts
//
//  Created by Amit Gupta on 14/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var characterViewModel : DisneyCharacterViewModel?
    @State private var currentSelection = false
    @State private var searchText: String = ""
    @State private var alphabetical: Bool = false
    
    /* 'filterCharacters' is a GET property which get excuted when user use sort and/or search feature */
    var filterCharacters: [DisneyCharacter] {
        let sortedCharacters = characterViewModel?.sort(by: alphabetical, characters: (characterViewModel?.disneyResponse?.data)!)
        return characterViewModel!.search(for: searchText, characters: sortedCharacters!)
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        if(characterViewModel?.disneyResponse?.data != nil){
                            ForEach(filterCharacters, id: \._id){ character in
                                CharacterListCell(character: character).listRowSeparator(.hidden)
                        }
                        }
                    }.onAppear(perform: fetch)
                }
                    .navigationTitle("Disney Characters")
                if let ch = characterViewModel, ch.showLoadingIndicator {
                    SpinnerView()
                } else {
                    SpinnerView().hidden()
                }
            }
            .searchable(text: $searchText)
            .toolbar {
                /* Sorting characters list by ID (Decreesing order currently for showing purpose because List mostly ordered by default) and Alphabetically. */
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        alphabetical.toggle()
                    }label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
            }
        }
    }
    
    private func fetch() {
        let restApiWrapper = RestAPIWrapper()
        characterViewModel = DisneyCharacterViewModel(apiWrapper: restApiWrapper)
        characterViewModel?.fetchCharacters(url: getCharacterAPI)
    }
}
 
