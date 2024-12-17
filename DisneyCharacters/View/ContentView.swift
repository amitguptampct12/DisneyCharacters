//
//  ContentView.swift
//  DogFacts
//
//  Created by Amit Gupta on 14/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var showIndicator = true
    @ObservedObject var characterViewModel = CharacterViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        if(characterViewModel.disneyResponse?.data != nil){
                            ForEach((characterViewModel.disneyResponse?.data)!, id: \._id){ character in
                                CharacterListCell(character: character).listRowSeparator(.hidden)
                        }
                        }
                    }
                }.onAppear(perform: fetch)
                    .navigationTitle("Disney Characters")
                if characterViewModel.showLoadingIndicator {
                    SpinnerView()
                } else {
                    SpinnerView().hidden()
                }
            }
        }
    }
    
    private func fetch() {
        characterViewModel.fetchCharacters()
    }
}
