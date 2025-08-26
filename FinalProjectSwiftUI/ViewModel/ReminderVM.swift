//
//  ReminderVM.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import Foundation
import Combine
import RealmSwift
class ReminderVM : ObservableObject{
    @Published var reminders: [Reminder] = []
    private var manager: RealmManager<Reminder>
    private var cancellables = Set<AnyCancellable>()
    init() {
        self.manager = RealmManager<Reminder>()
        bind()
    }
    private func bind() {
        manager.$items
            .receive(on: DispatchQueue.main)
            .assign(to: \.reminders, on: self)
            .store(in: &cancellables)
    }
    func addReminder(reminder: Reminder) {
        manager.add(reminder)
    }

//    func toggleDone(for task: Task) {
//        manager.update {
//            task.isDone.toggle()
//        }
//    }

    func deleteTask(_ reminder: Reminder) {
        manager.delete(reminder)
    }
}
