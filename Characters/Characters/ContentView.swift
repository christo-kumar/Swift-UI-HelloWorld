//
//  ContentView.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharacterTab(title: "Character", tabBarText: "Character", tabImageName: "person.fill", tagValue: 0)
            EpisodeTab(title: "Episodes", tabBarText: "Episodes", tabImageName: "play.circle.fill", tagValue: 1)
        }
    }
}

struct CharacterTab: View {
    let title: String
    let tabBarText: String
    let tabImageName: String
    let tagValue: Int
    var body: some View {
        NavigationView {
            CharacterList()
                .navigationTitle(title)
        }
        .tag(tagValue)
        .tabItem {
            VStack {
                Image(systemName: tabImageName)
                Text(tabBarText)
            }
        }
    }
}

struct EpisodeTab: View {
    let title: String
    let tabBarText: String
    let tabImageName: String
    let tagValue: Int
    var body: some View {
        NavigationView {
            EpisodeList()
                .navigationTitle(title)
        }.tag(tagValue)
        .tabItem {
            VStack {
                Image(systemName: tabImageName)
                    .foregroundColor(Color.gray)
                Text(tabBarText)
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
