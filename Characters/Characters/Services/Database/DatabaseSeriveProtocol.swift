//
//  DatabaseSeriveProtocol.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

protocol DatabaseServiceProtocol {
    
    associatedtype ManagedObject
    associatedtype ModuleData

    //Create
    func insertEntity(withName: String) ->NSManagedObject
    //Retrieve
    func fetchData(withName: String) -> [ManagedObject]?
    //Update
    func updateEntity(entity:ManagedObject)
    //Detele
    func deleteEntity(entity:ManagedObject)
}
