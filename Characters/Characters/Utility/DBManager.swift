//
//  DBManager.swift
//  Characters
//
//  Created by Christo Kumar on 06/07/22.
//

import Foundation
import CoreData

class DBManager {
    
    static let sharedInstance = DBManager()
    private let container:NSPersistentContainer

    private init() {
        self.container = NSPersistentContainer(name: AppUrls.containerName)
        self.setupDB()
    }
    
    func setupDB() {
        self.container.loadPersistentStores { ( _ , error) in
            if let error = error {
                print("Not able to load core data - \(error)")
            }
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        return container.viewContext
    }
    
    func saveContext() {
        do {
            try self.getContext().save()
        } catch let error {
            print("Unable to save data \(error)")
        }
    }
}
