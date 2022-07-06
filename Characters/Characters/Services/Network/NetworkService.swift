//
//  NetworkService.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//
import Foundation

class NetworkService: NetworkServiceProtocol {
    
    func fetchDataFromApi<T>(withUrl: String) async -> Result<T, NetworkError> where T : Decodable {
        guard let url = URL(string: withUrl) else {
            return .failure(.badUrl)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if ((response as? HTTPURLResponse)?.statusCode != 200) {
                return .failure(.badRequest)
            } else {
                let response = try JSONDecoder().decode(T.self, from: data)
                return .success(response)
            }
        } catch let error {
            debugPrint(error)
        }
        return .failure(.decodingError)
    }
}
