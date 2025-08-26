//
//  RealmManager.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import Foundation
import RealmSwift
import Combine

class RealmManager<T: Object>: ObservableObject {
    private let realm: Realm
    private var cancellables = Set<AnyCancellable>()

    @Published var items: [T] = []

    init(configuration: Realm.Configuration = .defaultConfiguration) {
        do {
            realm = try Realm(configuration: configuration)
            observeItems()
        } catch {
            fatalError("Failed to open Realm: \(error)")
        }
    }

    private func observeItems() {
        let results = realm.objects(T.self)
        results
            .collectionPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    print("Realm error: \(error)")
                }
            } receiveValue: { [weak self] items in
                self?.items = Array(items)
            }
            .store(in: &cancellables)
    }

    func add(_ item: T) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print("Error adding item: \(error)")
        }
    }

    func delete(_ item: T) {
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print("Error deleting item: \(error)")
        }
    }

    func update(_ updateBlock: @escaping () -> Void) {
        do {
            try realm.write {
                updateBlock()
            }
        } catch {
            print("Error updating item: \(error)")
        }
    }
}
