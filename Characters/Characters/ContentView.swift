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
            //EpisodeTab(title: "Advanced Search", tabBarText: "Search", tabImageName: "magnifyingglass.circle.fill", tagValue: 1)
            //CollectionTab(title: "Collection", tabBarText: "Collection", tabImageName: "person.fill", tagValue: 2)
        }
    }
}

struct CharacterTab: View {
    let title: String
    let tabBarText: String
    let tabImageName: String
    let tagValue: Int
    var body: some View {
        CharacterList()
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
        AdvancedSearchView()
                .tag(tagValue)
        .tabItem {
            VStack {
                Image(systemName: tabImageName)
                Text(tabBarText)
            }
        }
    }
}

struct CollectionTab: View {
    let title: String
    let tabBarText: String
    let tabImageName: String
    let tagValue: Int
    var body: some View {
        
        CharCollectionView()
        .tag(tagValue)
        .tabItem {
            VStack {
                Image(systemName: tabImageName)
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

