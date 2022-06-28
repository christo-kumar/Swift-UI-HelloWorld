//
//  CharacterCell.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCell: View {
    var image : String?
    var name : String?
    var status : String?
    var episodeCount : Int?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                WebImage(url: URL(string: self.image ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                    .clipped()
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(self.name ?? "Not nameable character").font(.title).bold()
                        Text(self.status ?? "Unknown").font(.subheadline)
                        Text("Appears in \(self.episodeCount ?? 0) episodes")
                            .font(.subheadline)
                    }
                    Spacer()
                }.padding()
            }.padding(.bottom)
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(image: "https://rickandmortyapi.com/api/character/avatar/17.jpeg", name: "Annie", status: "Alive", episodeCount: 5)
    }
}
