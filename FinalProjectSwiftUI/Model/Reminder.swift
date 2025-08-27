//
//  Reminder.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import Foundation
import RealmSwift

class Reminder : Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var descriptionR: String
    @Persisted var date: Date
    @Persisted var tag: List<String>
    static let defaultTags = ["Công việc", "Học tập", "Thói quen", "Sức khoẻ"]

    override init() {
        super.init()
        if tag.isEmpty {
            tag.append(objectsIn: Self.defaultTags)
        }
    }
    convenience init(title: String, date: Date, description: String) {
        self.init()
        self.title = title
        self.date = date
        self.descriptionR = description
//        self.tag.append(objectsIn: ["Công việc", "Học tập", "Thói quen", "Sức khoẻ"])
    }
}
