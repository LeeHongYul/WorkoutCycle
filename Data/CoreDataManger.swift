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

class WorkCycleManger: BaseManger {

    static let shared = WorkCycleManger()

    private override init() {}

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var workCycleList  = [WorkCycleEntity]()

    func fetchWorkCycle() {

        let request = WorkCycleEntity.fetchRequest()
        do {
            workCycleList = try mainContext.fetch(request)
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

    func deleteWorkData(WorkCycle: WorkCycleEntity) {
            mainContext.delete(WorkCycle)

            saveContext()
        }
}


class LatestDayManger: BaseManger {

    static let shared = LatestDayManger()

    private override init() {}

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var latestDayList = [LatestDayEntity]()

    func fetcthLatestDay() {

        let request = LatestDayEntity.fetchRequest()
        do {
            latestDayList = try mainContext.fetch(request)
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

    func deleteDayDate() {
        let data = latestDayList.first!
        mainContext.delete(data)
            saveContext()
    }
}

class CheckMarkManger: BaseManger {

    static let shared = CheckMarkManger()

    private override init() {}

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var checkMarkList = [CheckMarkEntity]()

//    func fetchByChecked() {
//        let request = CheckMarkEntity.fetchRequest()
//        let sortByCheck = NSSortDescriptor(key: "isChecked", ascending: false)
//        request.sortDescriptors = [sortByCheck]
//        do {
//            checkMarkList = try mainContext.fetch(request)
//        } catch {
//            print(error)
//        }
//    }

    func fetcthCheckMark() {

        let request = CheckMarkEntity.fetchRequest()
        do {
            checkMarkList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func addCheckMark(checkedDate: Date, isChecked: Bool) {
        let newCheck = CheckMarkEntity(context: mainContext)

        newCheck.checkedDate = checkedDate
        newCheck.isChecked = isChecked

        checkMarkList.insert(newCheck, at:  0)

        saveContext()
    }

    func deleteCheckMark() {
        let data = checkMarkList.first!
        mainContext.delete(data)
            saveContext()
    }
}


