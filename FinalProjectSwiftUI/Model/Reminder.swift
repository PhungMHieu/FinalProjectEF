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
    @Persisted var descriptionR: String?
    @Persisted var date: Date
    @Persisted var tag: List<String>
    convenience init(title: String, date: Date) {
        self.init()
        self.title = title
        self.date = date
        self.tag.append(objectsIn: ["Công việc", "Học tập", "Thói quen", "Sức khoẻ"])
    }
}
