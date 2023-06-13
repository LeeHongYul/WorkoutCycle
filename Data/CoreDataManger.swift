//
//  CoreDataManget.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import Foundation
import CoreData

class CoreDataManger {

    static let shared = CoreDataManger()

    private init() {}

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var workCycleList  = [WorkCycleEntity]()
    var latestDayList = [LatestDayEntity]()

    func fetchWorkCycle() {

        let request = WorkCycleEntity.fetchRequest()
        do {
            workCycleList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func fetcthLatestDay() {

        let request = LatestDayEntity.fetchRequest()
        do {
            latestDayList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }


    func addWorkCycle(name: String) {
        let newWorkCycle = WorkCycleEntity(context: mainContext)

        newWorkCycle.name = name

        workCycleList.insert(newWorkCycle, at: 0)
        
        saveContext()
    }

    func updateWorkCycle(update: WorkCycleEntity, name: String) {
        update.name = name

        do {
            try mainContext.save()
        } catch {
            print(error)
        }
    }

    func addLatestDay(latestDay: Int) {
        let newLatestDay = LatestDayEntity(context: mainContext)

        newLatestDay.latestDay = Int16(latestDay)

        latestDayList.insert(newLatestDay, at:  0)

        saveContext()
    }

    func updateTodayDay(update: LatestDayEntity, latestDay: Int) {
        update.latestDay = Int16(latestDay)

        do {
            try mainContext.save()
        } catch {
            print(error)
        }
    }


        func deleteWorkData() {
            let data = workCycleList.first!
            mainContext.delete(data)

            saveContext()
        }


    func deleteDayDate() {
        let data = latestDayList.first!
        mainContext.delete(data)
            saveContext()
    }




    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "WorkoutCycle")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
