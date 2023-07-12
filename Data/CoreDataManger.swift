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

class TagManger: BaseManger {
    static let shared = TagManger()

    private override init() {}

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var tagList  = [TagListEntity]()

    func fetchTag() {

        let request = TagListEntity.fetchRequest()
        do {
            tagList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func addTag(name: String) {
        let newTag = TagListEntity(context: mainContext)

        newTag.name = name

        tagList.insert(newTag, at: 0)

        saveContext()
    }

    func deleteTage(tag: String) {
        guard let deleteTag = tagList.first(where: { $0.name == tag }) else {
            return
        }

        mainContext.delete(deleteTag)
        saveContext()
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
    
    func deleteOneWorkData(workCycle: WorkCycleEntity) {
        mainContext.delete(workCycle)
        saveContext()
    }

    func deleteAllWorkData() {
        for i in workCycleList{
            mainContext.delete(i)
        }
        saveContext()
    }
}

class DayCheckManger: BaseManger {
    
    static let shared = DayCheckManger()
    
    private override init() {}
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var dayCheckList = [DayCheckEntity]()
    
    func fetcthDays() {
        
        let request = DayCheckEntity.fetchRequest()
        do {
            dayCheckList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addLatestDay(latestDay: Date, firstDay: Date?) {
        let newLatestDay = DayCheckEntity(context: mainContext)
        
        newLatestDay.latestDay = latestDay
        newLatestDay.firstDay = firstDay

        dayCheckList.insert(newLatestDay, at:  0)
        
        saveContext()
    }
    
    func updateTodayDay(update: DayCheckEntity, latestDay: Date) {
        update.latestDay = latestDay
        
        do {
            try mainContext.save()
        } catch {
            print(error)
        }
    }
    
    func deleteDayDate() {
        let data = dayCheckList.first!
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
    
    func fetchCheckMark() {
        
        let request = CheckMarkEntity.fetchRequest()
        do {
            checkMarkList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addCheckMark(checkedDate: Date) {
        let newCheck = CheckMarkEntity(context: mainContext)
        
        newCheck.checkedDate = checkedDate

        checkMarkList.insert(newCheck, at:  0)
        
        saveContext()
    }
    
    func deleteCheckMark() {
        for i in checkMarkList {
            mainContext.delete(i)
        }
        saveContext()
    }

    func removeCheckMark(checkedDate: Date) {

        guard let checkMark = checkMarkList.first(where: { $0.checkedDate == checkedDate }) else {
            return
        }
        checkMarkList = checkMarkList.filter { $0 != checkMark }
        print(checkMarkList.count)
        mainContext.delete(checkMark)
        saveContext()
    }
}


