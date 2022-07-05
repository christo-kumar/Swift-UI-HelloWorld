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
    @State private var currentPage = 1
    
    var body: some View {
        NavigationView {
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
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                if viewModal.shouldLoadData(currentIndex: character.id) {
                                    Task {
                                        self.currentPage += 1
                                        await viewModal.fetchData(forPage: self.currentPage)
                                    }
                                }
                            }
                        NavigationLink(destination: CharacterDetail(character: character)) {
                            EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                
            }.navigationTitle("Hello")
            .searchable(text: $searchText,
                         placement: .navigationBarDrawer(displayMode: .always),
                         prompt: "Search")
        }.onAppear {
            Task {
                await viewModal.fetchData(forPage: currentPage)
            }
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterList()
                .preferredColorScheme(.light)
            CharacterList()
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeLeft)
        }
        
    }
}
