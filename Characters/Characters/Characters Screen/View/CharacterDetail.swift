//
//  CharacterDetail.swift
//  Characters
//
//  Created by Christo Kumar on 30/06/22.
//

import SwiftUI

struct CharacterDetail: View {
    let character: WebCharacter
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(character: WebCharacter())
    }
}
