//
//  CharacterViewModel.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import Foundation

@MainActor
class CharacterViewModel : ObservableObject {
    
    private var networkService: NetworkServiceProtocol
    @Published var characters: [WebCharacter]
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        self.characters = []
    }
    
    func fetchData() async {
        let urlString = "https://rickandmortyapi.com/api/character/?"
        let result: Result<WebCharactersResponse, NetworkError> = await networkService.fetchDataFromApi(withUrl: urlString)
        switch result {
        case .success( let characterResponse):
            if let characters = characterResponse.results {
                self.characters = characters
            }
        case .failure(let error):
            print(error)
        }
    }
}


