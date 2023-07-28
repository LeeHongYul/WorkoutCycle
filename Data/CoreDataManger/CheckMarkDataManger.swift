//
//  CheckMarkDataManger.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/28.
//

import Foundation
import CoreData


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
        guard let checkMark = checkMarkList.first(where: {$0.checkedDate == checkedDate}) else {
        return
        }
        checkMarkList = checkMarkList.filter{ $0 != checkMark }

        mainContext.delete(checkMark)
        saveContext()
}

//    func removeCheckMark(checkedDate: CheckMarkEntity) {
//
//        mainContext.delete(checkedDate)
//        saveContext()
//    }
}
