//
//  ServiceProtocol.swift
//  Characters
//
//  Created by Christo Kumar on 28/06/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badRequest
    case decodingError
}

protocol NetworkServiceProtocol {
    func fetchDataFromApi<T:Decodable>(withUrl: String) async -> Result<T,NetworkError>
}
