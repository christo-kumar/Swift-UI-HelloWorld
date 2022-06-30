//
//  CharacterList.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import SwiftUI

struct CharacterList: View {
    
    @ObservedObject var viewModal = CharacterViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            //Search Bar
            List{
                ForEach(self.viewModal.characters.filter{ character in
                    return self.searchText.isEmpty ? true : character.name!.lowercased().contains(self.searchText.lowercased()) 
                }
                        , id: \.id) { character in
                    ZStack {
                        CharacterCell(image: character.image,
                                      name: character.name,
                                      status: character.status,
                                      episodeCount: character.episode?.count)
                            .frame(width: 300, height: 300)
                        NavigationLink(destination: CharacterDetail(character: character)) {
                            EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                
            }.searchable(text: $searchText,
                         placement: .navigationBarDrawer(displayMode: .always),
                         prompt: "Search")
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
