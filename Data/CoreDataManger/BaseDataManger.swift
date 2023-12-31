//
//  CoreDataManget.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import Foundation
import CoreData

class BaseManger {
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        
        let container = NSPersistentCloudKitContainer(name: "WorkoutCycle")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
