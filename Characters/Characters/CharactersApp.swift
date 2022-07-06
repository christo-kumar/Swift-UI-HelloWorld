//
//  CharactersApp.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import SwiftUI

@main
struct CharactersApp: App {
    let dbManager = DBManager.sharedInstance
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
