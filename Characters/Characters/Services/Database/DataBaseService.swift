//
//  DataBaseService.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

class DataBaseService<T:NSManagedObject> {
    
    func fetchData(withName: String) -> [CharacterEntity]?{
        let request = NSFetchRequest <CharacterEntity>(entityName: withName)
        do {
            let data = try DBManager.sharedInstance.getContext().fetch(request)
            return data
        } catch let error {
            print("Unable to fetch data \(error)")
        }
        return nil
    }
    
    func insertCharacter(withCharacter: WebCharacter) {
        let character = CharacterEntity(context: DBManager.sharedInstance.getContext())
        character.id = Int64(withCharacter.id ?? 0)
        character.name = withCharacter.name
        character.imageUrl = withCharacter.image
        DBManager.sharedInstance.saveContext()
    }
    
    func updateEntity(entity: CharacterEntity, character: WebCharacter) {
        entity.name = character.name
        entity.imageUrl = character.url
        DBManager.sharedInstance.saveContext()
    }
    
    func deleteEntity(entity: CharacterEntity) {
       let context = DBManager.sharedInstance.getContext()
        context.delete(entity)
        DBManager.sharedInstance.saveContext()
    }
}
