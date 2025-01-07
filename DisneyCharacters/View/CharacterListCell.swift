//
//  CharacterListCell.swift
//  DogFacts
//
//  Created by Amit Gupta on 15/12/24.
//

import SwiftUI

/* Custom list cell to show disney characters
    If there is no image coming from server due to any network/server error it will show a default image,
    untill image downloaded from server a activity
    indicator will continue showing.
 */

struct CharacterListCell: View {
    @State var character : DisneyCharacter
    @State var characterImage : Image = Image(systemName: "placeHolderImage")
    @State var showDetails = false
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: character.imageUrl ?? "")) { phase in
                        switch phase {
                        case .failure:
                            characterImage
                                .font(.largeTitle)
                        case .success(let image):
                            image.resizable()
                                .onAppear{
                                    characterImage = image
                                }
                        default:
                            ProgressView()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 256)
                    .clipShape(.rect(cornerRadius: 25))
            HStack{
                VStack {
                    Text(character.name ?? "").font(.system(size: 15, design: .rounded)).foregroundColor(.gray).fontWeight(.semibold)
                    Text(character.createdAt?.formatDate() ?? "").font(.system(size: 12, design: .rounded)).foregroundColor(.gray).fontWeight(.semibold)
                }
                Spacer()
                Button("know More") {
                    self.showDetails.toggle()
                }.sheet(isPresented: $showDetails){

                    CharacterInfoView(characterImage: $characterImage, character: $character)
                }.padding(EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0))
                
            }.padding(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0.0, trailing: 40.0))
        }
    }
}
