//
//  EpisodeList.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import SwiftUI

struct EpisodeView: View {
    
    @ObservedObject var viewModel = EpisodeViewModel()
    let episodeUrl: String
    
    var body: some View {
        HStack {
            Text(viewModel.episode?.name ?? "").font(.headline).bold()
            Text("(\(viewModel.episode?.episode ?? ""))").font(.caption)
        }
        .onAppear(perform: {
            Task {
                await viewModel.fetchApiData(withUrl: episodeUrl)
            }
        })
        .frame(width: 300, height: 100, alignment: .center)
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct EpisodeList_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episodeUrl: "")
    }
}
