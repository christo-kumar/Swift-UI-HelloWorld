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
    private var repository: RepositoryProtocol
    @Published var characters: [WebCharacter]
    @Published var charactersFromDb: [WebCharacter]
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         repository: RepositoryProtocol = CharacterRepository<DataBaseService>()) {
        self.networkService = networkService
        self.repository = repository
        self.characters = []
        self.charactersFromDb = []
    }
    
    func fetchData(forPage: Int) async {
        let urlString = AppUrls.baseUrl + "\(forPage)"
        let result: Result<WebCharactersResponse, NetworkError> = await networkService.fetchDataFromApi(withUrl: urlString)
        switch result {
        case .success( let characterResponse):
            if let characters = characterResponse.results {
                self.characters.append(contentsOf: characters)
                insertData()
            }
        case .failure(let error):
            print(error)
        }
    }
    
    func shouldLoadData(currentIndex: Int?) -> Bool {
        return currentIndex == characters.count
    }
}

extension CharacterViewModel {
    
    func insertData() {
        for character in self.characters {
            self.repository.createData(withData: character)
        }
    }
    
    func fetchDataFromDb() {
        self.repository.retriveData()
        if let moduleData = self.repository.getModuleData() as? [WebCharacter] {
            self.charactersFromDb.append(contentsOf: moduleData)
        }
    }
}


