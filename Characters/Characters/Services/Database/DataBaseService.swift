//
//  DataBaseService.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

class DataBaseService : DatabaseServiceProtocol {
    
    func fetchData<T>(withName: String) -> [T]? where T : NSManagedObject {
        let request = NSFetchRequest <CharacterEntity>(entityName: withName)
        do {
            let data = try DBManager.sharedInstance.getContext().fetch(request)
            return data as? [T]
        } catch let error {
            print("Unable to fetch data \(error)")
        }
        return nil
    }
    
    func deleteEntity<T>(entity: T) where T : NSManagedObject {
        let context = DBManager.sharedInstance.getContext()
         context.delete(entity)
         DBManager.sharedInstance.saveContext()
    }
    
    func insertEntity<V>(withDecodable: V) where V : Decodable {
        let character = CharacterEntity(context: DBManager.sharedInstance.getContext())
        if let webCharacter = withDecodable as? WebCharacter {
            character.id = Int64(webCharacter.id ?? 0)
            character.name = webCharacter.name
            character.imageUrl = webCharacter.image
            DBManager.sharedInstance.saveContext()
        }
    }
    
    func updateEntity<T, V>(entity: T, with: V) where T : NSManagedObject, V : Decodable {
        if let entity = entity as? CharacterEntity, let character = with as? WebCharacter {
            entity.name = character.name
            entity.imageUrl = character.url
            DBManager.sharedInstance.saveContext()
        }
    }
}
