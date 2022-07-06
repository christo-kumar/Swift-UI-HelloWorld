//
//  DataBaseService.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

class DataBaseService : DatabaseServiceProtocol{
    
    typealias ManagedObject = NSManagedObject
    typealias ModuleData = Decodable
    
    //Create
    func insertEntity(withName: String) ->NSManagedObject {
        let entity = NSEntityDescription.insertNewObject(forEntityName: withName,
                                            into: DBManager.sharedInstance.getContext())
        return entity
        
    }
    
    //Retrive
    func fetchData(withName: String) -> [NSManagedObject]? {
        let request = NSFetchRequest <CharacterEntity>(entityName: withName)
        do {
            let data = try DBManager.sharedInstance.getContext().fetch(request)
            return data
        } catch let error {
            print("Unable to fetch data \(error)")
        }
        return nil
    }
    
    func deleteEntity(entity: NSManagedObject) {
        let context = DBManager.sharedInstance.getContext()
         context.delete(entity)
         DBManager.sharedInstance.saveContext()
    }
    
    func updateEntity(entity: NSManagedObject) {
        DBManager.sharedInstance.saveContext()
    }
}
