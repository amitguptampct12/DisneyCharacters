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
    var character : DisneyCharacter?
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: character?.imageUrl ?? "")) { image in
                        switch image {
                        case .failure:
                            Image("placeHolderImage")
                                .font(.largeTitle)
                        case .success(let image):
                            image
                                .resizable()
                        default:
                            ProgressView()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 256)
                    .clipShape(.rect(cornerRadius: 25))
            
            Text(character?.name! ?? "").font(.system(size: 15, design: .rounded)).foregroundColor(.gray).fontWeight(.semibold)
            Text(character?.createdAt?.formatDate() ?? "").font(.system(size: 12, design: .rounded)).foregroundColor(.gray).fontWeight(.semibold)
        }
    }
}
