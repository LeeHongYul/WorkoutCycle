//
//  TagListDataManger.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/28.
//

import Foundation
import CoreData


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
            ValidationError.cancel
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

    func deleteAllTage() {
        for i in tagList{
            mainContext.delete(i)
        }
        saveContext()
    }
}
