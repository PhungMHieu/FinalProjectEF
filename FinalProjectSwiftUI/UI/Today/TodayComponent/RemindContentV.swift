//
//  RemindContentV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct RemindContentV: View {
    @State var isSelected: Bool = false
//    @FocusState private var isFocused: Bool
    @State private var input: String = ""
    @EnvironmentObject var viewModel: ReminderVM
    var title: String
    
    var body: some View {
        HStack(alignment: .top) {
            VStack{
                Button {
                    let reminder = Reminder(title: input, date: .now)
                    if(input != "") {
                        viewModel.addReminder(reminder: reminder)
                    }
                } label: {
                    Image(.ratio)
                        .padding(.top,1)
                }
            }
            HStack(alignment: .top){
                VStack(spacing:6) {
                    TextField(text: $input) {
                        Text(title)
                    }
                    
                    TextField(text: .constant("")) {
                        Text("Reminder")
                    }
                }
                Spacer()
                Button {
                    isSelected.toggle()
                } label: {
                    Image(.infoIcn)
                }
//                .hidden()
                .padding(.top,3)
                .padding(.trailing, 6)
            }
            .padding(.top,6)
        }
        .sheet(isPresented: $isSelected, content: {
            RemindersAddV()
        })
        
    }
}

//#Preview {
//    RemindContentV()
//}
