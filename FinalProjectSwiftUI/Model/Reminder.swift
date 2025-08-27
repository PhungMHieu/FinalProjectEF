//
//  Reminder.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

//import Foundation
//import RealmSwift

//class Reminder : Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted var title: String
//    @Persisted var descriptionR: String
//    @Persisted var date: Date
//    @Persisted var tag: List<String>
//    static let defaultTags = ["Công việc", "Học tập", "Thói quen", "Sức khoẻ"]
//
//    override init() {
//        super.init()
//        if tag.isEmpty {
//            tag.append(objectsIn: Self.defaultTags)
//        }
//    }
//    convenience init(title: String, date: Date, description: String) {
//        self.init()
//        self.title = title
//        self.date = date
//        self.descriptionR = description
////        self.tag.append(objectsIn: ["Công việc", "Học tập", "Thói quen", "Sức khoẻ"])
//    }
//}
import Foundation
import RealmSwift

// MARK: - Tag model
// Dùng EmbeddedObject nếu tag chỉ sống kèm với Reminder
class ReminderTag: EmbeddedObject {
    @Persisted var name: String = ""
    @Persisted var isSelected: Bool = false
}

// MARK: - Reminder model
class Reminder: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var descriptionR: String = ""
    @Persisted var date: Date = Date()
    @Persisted var tags = List<ReminderTag>()

    // Tên tag mặc định
    static let defaultTagNames = ["Công việc", "Học tập", "Thói quen", "Sức khoẻ"]

    override init() {
        super.init()
        addDefaultTagsIfNeeded()
    }

    // Dùng tham số withDefaultTags CHỈ khi khởi tạo
    convenience init(title: String, date: Date, description: String, withDefaultTags: Bool = true) {
        self.init()
        self.title = title
        self.date = date
        self.descriptionR = description
        if withDefaultTags { addDefaultTagsIfNeeded(force: true) }
    }

    // Helper đổ tag mặc định
    private func addDefaultTagsIfNeeded(force: Bool = false) {
        guard force || tags.isEmpty else { return }
        tags.removeAll()
        let list: [ReminderTag] = Self.defaultTagNames.map { name in
            let t = ReminderTag()
            t.name = name
            t.isSelected = false
            return t
        }
        tags.append(objectsIn: list)
    }
}
