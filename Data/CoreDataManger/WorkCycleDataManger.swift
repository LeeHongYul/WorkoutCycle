//
//  WorkCycleDataManger.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/28.
//

import Foundation
import CoreData

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
            ValidationError.cancel
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
            ValidationError.cancel
        }
    }

    func deleteOneWorkData(workCycle: WorkCycleEntity) {
        mainContext.delete(workCycle)
        saveContext()
    }

    func deleteAllWorkData() {
        for i in workCycleList {
            mainContext.delete(i)
        }
        saveContext()
    }
}
