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
        
        VStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
            WebImage(url: URL(string: self.image ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
            VStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
                Text(self.name ?? "Not nameable character").font(.title).bold()
                Text(self.status ?? "Unknown").font(.subheadline)
                Text("Appears in \(self.episodeCount ?? 0) episodes")
                    .font(.subheadline)
            }.padding(.leading, AppDimensions.standardSpacing)
        }.padding(.bottom)
            .background(Color.gray)
            .cornerRadius(AppDimensions.cellCornerRadius)
            .shadow(radius: AppDimensions.cellShadowRadius)
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(image: "https://rickandmortyapi.com/api/character/avatar/17.jpeg", name: "Annie", status: "Alive", episodeCount: 5)
    }
}
