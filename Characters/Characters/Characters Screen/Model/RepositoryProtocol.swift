//
//  ChracterRepositoryProtocol.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation

protocol RepositoryProtocol {
    func retriveData()
    func createData(withData: Decodable)
    func updateData(withData: Decodable)
    func deleteData()
    func getModuleData() -> [Decodable]
}
