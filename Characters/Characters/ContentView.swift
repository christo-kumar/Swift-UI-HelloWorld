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
            TabScreen(title: "Characters", tabBarText: "Characters", tabImageName: "person.circle.fill")
        }
    }
}

struct TabScreen: View {
    
    let title: String
    let tabBarText: String
    let tabImageName: String
    
    var body: some View {
        NavigationView {
            CharacterList()
                .navigationBarTitle(title)
        }
        .tag(0)
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

