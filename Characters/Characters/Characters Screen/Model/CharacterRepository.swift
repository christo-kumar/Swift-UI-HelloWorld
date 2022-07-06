//
//  CharacterRepository.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

class CharacterRepository<T:DatabaseServiceProtocol>: RepositoryProtocol {
    
    private let dbService: T
    var entities:[CharacterEntity] = []
    
    init(dbService: T = DataBaseService() as! T){
        self.dbService = dbService
    }
    
    func createData(withData: Decodable) {
        if let withData = withData as? WebCharacter {
            let entity = self.dbService.insertEntity(withName: AppUrls.characterEntity)
            if let entity = entity as? CharacterEntity {
                entity.id = Int64(withData.id ?? 0)
                entity.name = withData.name
                entity.imageUrl = withData.image
                DBManager.sharedInstance.saveContext()
            }
        }
    }
    
    func retriveData(){
        let data = dbService.fetchData(withName: AppUrls.characterEntity)
        if let data = data as? [CharacterEntity] {
            self.entities.append(contentsOf: data)
        }
    }
    
    func updateData(withData: Decodable) {
        if let withData = withData as? WebCharacter {
            let entity = entities.first { entity in
                return entity.id == withData.id ?? 0
            }
            if let entity = entity {
                entity.name = "something other"
                if let entity = entity as? T.ManagedObject {
                    dbService.updateEntity(entity: entity)
                }
            }
        }
    }
    
    func deleteData() {
        
    }
    
    func getModuleData() -> [Decodable] {
        var retval:[WebCharacter] = []
        for entity in entities {
            let character = WebCharacter(id: Int(truncatingIfNeeded: entity.id), name: entity.name, image: entity.imageUrl)
            retval.append(character)
        }
        return retval as [Decodable]
    }
}
