//
//  CharacterDetail.swift
//  Characters
//
//  Created by Christo Kumar on 30/06/22.
//
import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetail: View {
    let character: WebCharacter
    
    init(character: WebCharacter) {
        self.character = character
    }
    var body: some View {
        ScrollView {
            VStack {
                BackgroundView()
                    .frame(height: AppDimensions.detailBackgroundViewHeight)
                CircleImage(url: character.image ?? "")
                    .frame(width: AppDimensions.detailImageViewWidth
                            ,
                           height: AppDimensions.detailImageViewWidth)
                    .offset(y: AppDimensions.detailBottomOffset)
                    .padding(.bottom, AppDimensions.detailBottomPadding)
                VStack(alignment: .center) {
                    Text(character.name ?? "Unknown")
                        .font(.title)
                    MainCharacterAttributes(character: character)
                }.padding()
                DataCard(character: character)
                VStack {
                    ForEach(character.episode ?? [], id: \.self) { str in
                        EpisodeView(episodeUrl: str)
                    }
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct CircleImage: View {
    var url : String
    var body: some View {
        WebImage(url: URL(string: url))
        .resizable()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.gray,lineWidth: AppDimensions.detailLineWidth))
        .shadow(radius: AppDimensions.detailShadowRadius)
    }
}

struct BackgroundView: View {
    var body: some View {
        Image("background").resizable()
    }
}

struct MainCharacterAttributes : View {
    var character: WebCharacter
    var body: some View {
        HStack {
            VStack {
                Text("Status")
                    .font(.headline)
                Text(character.status ?? "Unknown")
                    .font(.caption)
            }
            Spacer()
            VStack {
                Text("Species")
                    .font(.headline)
                Text(character.species ?? "Unknown")
                    .font(.caption)
            }
            Spacer()
            if !character.type!.isEmpty {
                VStack {
                    Text("Type")
                        .font(.headline)
                    Text(character.type ?? "Unknown")
                        .font(.caption)
                }
                Spacer()
            }
            VStack {
                Text("Gender")
                    .font(.headline)
                Text(character.gender ?? "Unknown")
                    .font(.caption)
            }
        }.padding()
    }
}

struct DataCard : View {
    var character : WebCharacter
    var body: some View {
            VStack {
                VStack {
                    Text("Origin").font(.headline).bold()
                    Text(character.origin?.name ?? "Location Unknown")
                        .font(.subheadline)
                }.padding()
                VStack {
                    Text("Location").font(.headline).bold()
                    Text(character.location?.name ?? "Location Unknown")
                        .font(.subheadline)
                }
                
                VStack() {
                    Text("Episodes \(character.name ?? "this character") appears in").bold().multilineTextAlignment(.center).font(.headline)
                    Text("\(character.episode?.count ?? 0)")
                        .font(.subheadline)
                }.padding()
            }.frame(width: AppDimensions.dataCardWidth,
                    alignment: .top)
                .background(Color("backgroundC"))
                .cornerRadius(AppDimensions.cellCornerRadius)
                .shadow(radius: AppDimensions.cellShadowRadius)
                .padding(.bottom)
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(character: WebCharacter(id: 1, name: "Rick", status: "Alive", type: "Boy", gender: "Male", origin: nil, location: nil, species: "Human", image: nil, episode: ["1"], url: nil, created: nil))
    }
}
