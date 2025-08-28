//
//  RemindersAddV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI
import RealmSwift

struct RemindersAddV: View {
    @State var showDatePicker: Bool = false
    @State var present: Bool = false
    
    @State private var title: String
    @State private var detail: String
    @State private var date: Date
    @State private var tag: [ReminderTag]
    @State var tagSelected: String = ""
    @ObservedRealmObject var reminder: Reminder
    @Environment(\.dismiss) private var dismiss
    // Điền giá trị ban đầu từ Realm vào @State
    init(reminder: Reminder) {
        self._reminder = ObservedRealmObject(wrappedValue: reminder)
        _title = State(initialValue: reminder.title)
        _detail = State(initialValue: reminder.descriptionR)
        _date = State(initialValue: reminder.date)
        _tag = State(initialValue: Array(reminder.tags))
    }
    var body: some View {
        NavigationStack {
            VStack(spacing:16) {
                VStack(spacing:16) {
                    TextField(text: $title) {
                        Text("Title")
                            .font(.system(size: 17,weight: .regular))
                            .foregroundStyle(.neutral3)
                    }
                    Divider()
                    TextField(text: $detail) {
                        Text("Description")
                            .font(.system(size: 17,weight: .regular))
                            .foregroundStyle(.neutral3)
                    }
                }
                .padding(.vertical,16)
                .padding(.leading,12)
                .background(.neutral5)
                .cornerRadius(12)
                VStack{
                    HStack {
                        Image(.icnDate)
                        Spacer()
                        Text("Date")
                        Toggle("", isOn: $showDatePicker)
                    }
                    if showDatePicker {
                        DatePicker(
                            "Select Date",
                            selection: $date,
                            displayedComponents: .date
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .background(.neutral5)
                        .labelsHidden()
                        .tint(.accent)
                        .background(.neutral5)
                        .overlay(alignment: .top) {
                            Divider()
                                .padding(.leading,44)
                                .padding(.trailing,0)
                        }
                    }
                }
                .padding()
                .background(.neutral5)
                .cornerRadius(12)
                Button(action: {
                    self.present.toggle()
                }) {
                    HStack(spacing:0) {
                        Image(.icnRepeat)
                            .padding(.trailing,12)
                        Text("Tag")
                            .foregroundStyle(.neutral1)
                        Spacer()
                        ForEach(tag, id: \.self) { tag in
                            if(tag.isSelected) {
                                Text("\(tag.name)")
                            }
//                            var string: String = tag.name
//                            var string: String = tag.name
//                            if tag.isSelected {
//                                Text(tagSelected == "" ? "None" : tag)
//                                    .font(.system(size: 17))
//                                    .foregroundStyle(.neutral2)
//                                    .lineLimit(1)
//                                    .padding(.leading,39)
//                                Image(.icnArrowRight)
//                                    .padding(.leading,6)
//                            }
                        }
                    }
                    .padding()
                    .background(.neutral5)
                    .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding(16)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        saveAndClose()
                    }
                    .font(.system(size: 17,weight: .semibold))
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        print("Edit tapped")
                        dismiss()
                    }
                    .foregroundStyle(.accent)
                    .font(.system(size: 17))
                }
                ToolbarItem (placement: .principal){
                    Text("New reminder")
                        .font(.system(size: 17,weight: .semibold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.backgroundRemindersAdd)
            .sheet(isPresented: $present, content: {
                TagV(tags: $tag)
            })
        }
    }
    
    // Chỉ ghi về Realm khi bấm Done
    private func saveAndClose() {
        let t = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let d = detail.trimmingCharacters(in: .whitespacesAndNewlines)
        
        do {
            let realm = try Realm()
            try realm.write {
                // Upsert (update nếu tồn tại, tạo mới nếu chưa)
                realm.create(Reminder.self, value: [
                    "id": reminder.id,                
                    "title": t,
                    "descriptionR": d,
                    "date": date,
                    "tag": self.tag
                ], update: .modified)
            }
        } catch {
            print("Realm write failed: \(error)")
        }
        dismiss()
    }
}
//#Preview {
//    RemindersAddV(reminder: Reminder())
//}
