//
//  CharacterInfoView.swift
//  DisneyCharacters
//
//  Created by Amit Gupta on 24/12/24.
//

import SwiftUI

struct CharacterInfoView: View {
    @Binding var characterImage : Image
    @Binding var character : DisneyCharacter
    var body: some View {
        ScrollView{
        VStack{
            if let name = character.name {
                Text(name).bold().font(.system(size: 24)).foregroundStyle(.purple)
            }
            characterImage.resizable().frame(width: UIScreen.main.bounds.width - 25, height: 256)
            VStack{
                HStack{
                    Text("Name:").bold()
                    Spacer()
                    if let name = character.name {
                        Text(name)
                    }
                }
                HStack{
                    Text("Created Date:").bold()
                    Spacer()
                    Text((character.createdAt?.formatDate() ?? ""))
                }
                HStack{
                    Text("Films:").bold()
                    Spacer()
                    if let films = character.films, films.count != 0 {
                        Text(films.joined(separator: " ,"))
                    }else{  Text("NA") }
                    
                }
                HStack{
                    Text("TV Shows:").bold()
                    Spacer()
                    if let tvShows = character.tvShows, tvShows.count != 0 {
                        Text(tvShows.joined(separator: " ,"))
                    }else{  Text("NA") }
                }
                Spacer()
            }.padding(EdgeInsets(top: 0.0, leading: 25.0, bottom: 0.0, trailing: 25.0))
        }.padding(EdgeInsets(top: 50.0, leading: 20.0, bottom: 0.0, trailing: 20.0))
    }
    }
}

