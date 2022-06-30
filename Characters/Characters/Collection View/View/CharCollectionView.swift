//
//  CharCollectionView.swift
//  Characters
//
//  Created by Christo Kumar on 30/06/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharCollectionView: View {
    
    @ObservedObject var viewModal = CharacterViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8, alignment: nil),
        GridItem(.flexible(), spacing: 8, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 8,
                pinnedViews: []) {
                    ForEach(self.viewModal.characters) { character in
                        ZStack {
                            WebImage(url: URL(string: character.image ?? "")).resizable().scaledToFit()
                            NavigationLink(destination: CharacterDetail(character: character)) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
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

struct CharCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CharCollectionView()
    }
}
