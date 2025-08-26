//
//  ContentView.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI
import RealmSwift
// DRAFT tạm cho hàng “add inline”
struct DraftReminder: Equatable {
    var title: String = ""
    var detail: String = ""
    var date: Date = .now
}

struct ContentView: View {
    @State var searchText: String = ""
    @State var presentSheet: Bool = false
    @State var draft: DraftReminder? = nil
    @ObservedResults(Reminder.self) var reminders
    @State var selected: Reminder? = nil
    @FocusState private var isTitleFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchBarV(searchText: $searchText)
                    .padding(.top,8)
                List {
                    // SECTION dữ liệu thật
                    if !reminders.isEmpty {
                        Section {
                            ForEach(reminders.filter { Calendar.current.isDateInToday($0.date) }) { item in
                                RemindContentV(reminder: item, title: item.title)
                            }
                            .onDelete(perform: $reminders.remove)
                        } header: {
                            Text("Today")
                                .frame(height: 26)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.neutral1)
                                .padding(.bottom,12)
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        Section {
                            ForEach(reminders.filter { $0.date > Date() }) { item in
                                RemindContentV(reminder: item, title: item.title)
                            }
                            .onDelete(perform: $reminders.remove)
                        } header: {
                            Text("Upcoming")
                                .frame(height: 26)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.neutral1)
                                .padding(.bottom,12)
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    }
                    
                    
                    if let _ = draft {
                        Section {
                            DraftRow(
                                draft: Binding(get: { draft! }, set: { draft = $0 }),
                                onCommit: { d in
                                    let t = d.title.trimmingCharacters(in: .whitespacesAndNewlines)
                                    let detail = d.detail.trimmingCharacters(in: .whitespacesAndNewlines)
                                    if !t.isEmpty {
                                        let new = Reminder()
                                        new.title = t
                                        new.descriptionR = detail
                                        new.date = d.date
                                        $reminders.append(new)   // lưu Realm
                                    }
                                    draft = nil                  // đóng hàng tạm (lưu/hủy đều clear)
                                }
                            )
                            .id("draftRow") // ID ổn định để List không nhầm danh tính cell
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    }

                }
                .listStyle(.inset)
                .padding(.horizontal, 16)
                .scrollContentBackground(.hidden)
                .onAppear {
                    do {
                        let realm = try Realm() // dùng defaultConfiguration
                        if let url = realm.configuration.fileURL {
                            print("📂 Realm file path:", url.path)
                        }
                    } catch {
                        print("⚠️ Failed to open Realm:", error)
                    }
                }
                Spacer()
            }
            .overlay(alignment: .center, content: {
                if(reminders.isEmpty){
                    Text("No Reminders")
                        .font(.system(size: 20))
                        .foregroundStyle(.neutral3)
                }
            })
            .toolbar {
                // Nút bên phải trên navigation bar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                       reminders.sorted(byKeyPath: "date", ascending: true)
                    } label: { Image(systemName: "arrow.up.arrow.down.circle.fill") }
                }
                
                // Nút bên dưới trái (bottom toolbar)
                ToolbarItem(placement: .bottomBar) {
                    BottomBarV(){
                        withAnimation {
                            if draft == nil { draft = DraftReminder() }
                        }
                    }
                }
                
                ToolbarItem (placement: .principal){
                    Text("Reminders")
                        .font(.system(size: 20,weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.neutral5)
        }
    }
    
}
