//
//  DayCheckDataManger.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/28.
//

import Foundation
import CoreData

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
            ValidationError.cancel
        }
    }

    func addLatestDay(latestDay: Date, firstDay: Date?) {
        let newLatestDay = DayCheckEntity(context: mainContext)

        newLatestDay.latestDay = latestDay
        newLatestDay.firstDay = firstDay

        dayCheckList.insert(newLatestDay, at: 0)

        saveContext()
    }

    func updateTodayDay(update: DayCheckEntity, latestDay: Date) {
        update.latestDay = latestDay

        do {
            try mainContext.save()
        } catch {
            ValidationError.cancel
        }
    }

    func deleteDayDate() {
        for i in dayCheckList {
            mainContext.delete(i)
        }
        saveContext()
    }
}
