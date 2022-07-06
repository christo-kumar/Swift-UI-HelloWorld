//
//  DatabaseSeriveProtocol.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

protocol DatabaseServiceProtocol {
    func fetchData<T:NSManagedObject>(withName: String) -> [T]?
    func deleteEntity<T:NSManagedObject>(entity:T)
    func insertEntity<V:Decodable>(withDecodable: V)
    func updateEntity<T:NSManagedObject, V: Decodable>(entity:T, with: V)
}
