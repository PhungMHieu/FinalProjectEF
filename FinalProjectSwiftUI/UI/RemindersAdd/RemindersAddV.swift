//
//  RemindersAddV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct RemindersAddV: View {
    @State var showDatePicker: Bool = false
    @State var selectedDate: Date = .now
    @State var present: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing:16) {
                VStack(spacing:16) {
                    TextField(text: .constant("")) {
                        Text("Title")
                            .font(.system(size: 17,weight: .regular))
                            .foregroundStyle(.neutral3)
                    }
                    Divider()
                    TextField(text: .constant("")) {
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
                            selection: $selectedDate,
                            displayedComponents: .date
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .background(.neutral5)
                        .labelsHidden()
                        .padding(.leading, 8) // hoặc .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading) // full width
                        .contentShape(Rectangle())
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
                    HStack {
                        Image(.icnRepeat)
                        Text("Tag")
                        Spacer()
                        Image(.icnArrowRight)
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
                        print("Edit tapped")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        print("Edit tapped")
                    }
                }
                ToolbarItem (placement: .principal){
                    Text("New reminder")
                        .font(.system(size: 17,weight: .semibold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.backgroundRemindersAdd)
            .sheet(isPresented: $present, content: {
                TagV()
            })
        }
    }
}

//#Preview {
//    RemindersAddV()
//}
