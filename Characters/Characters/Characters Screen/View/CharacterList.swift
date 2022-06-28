//
//  CharacterList.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import SwiftUI

struct CharacterList: View {
    
    @ObservedObject var viewModal = CharacterViewModel()
    
    var body: some View {
        VStack {
            //Search Bar
            List{
                ForEach(viewModal.characters, id: \.id) { character in
                    ZStack {
                        CharacterCell(image: character.image,
                                      name: character.name,
                                      status: character.status,
                                      episodeCount: character.episode?.count)
                            .frame(width: 300, height: 300)
                    }
                }
            }
        }.onAppear {
            Task {
                await viewModal.fetchData()
            }
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
