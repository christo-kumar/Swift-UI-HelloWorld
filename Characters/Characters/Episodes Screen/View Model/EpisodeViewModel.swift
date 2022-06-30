//
//  EpisodeViewModel.swift
//  Characters
//
//  Created by Christo Kumar on 30/06/22.
//

import Foundation

@MainActor
class EpisodeViewModel: ObservableObject {
    
    private var networkService: NetworkServiceProtocol
    @Published var episode: EpisodeModel? = nil
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchApiData(withUrl: String?) async {
        if let urlString = withUrl {
            let result:Result<EpisodeModel,NetworkError> = await networkService.fetchDataFromApi(withUrl: urlString)
            switch result {
            case .success(let episode):
                self.episode = episode
                break
            case .failure(_):
                break
            }
        }
    }
}
