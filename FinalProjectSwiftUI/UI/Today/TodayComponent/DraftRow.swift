//
//  drawftRowV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import SwiftUI

struct DraftRow: View {
    @Binding var draft: DraftReminder
    var onCommit: (DraftReminder) -> Void

    // Quản lý focus để biết lúc nào “mất focus toàn bộ”
    enum Field: Hashable { case title, detail }
    @FocusState var focused: Field?

    var body: some View {
        HStack(alignment: .top) {
            VStack{
                Button {
                    
                } label: {
                    Image(.ratio)
                        .padding(.top,1)
                }
            }
            VStack{
                HStack(alignment: .top){
                    VStack(spacing:6) {
                        TextField(text: $draft.title) {
                            Text("Title")
                        }
                        .font(.system(size: 15))
                        .foregroundStyle(.neutral1)
                        .focused($focused, equals: .title)
                        
                        TextField(text: .constant("")) {
                            Text("Reminder")
                        }
                        .font(.system(size: 15))
                        .foregroundStyle(.neutral2)
                    }
                    Spacer()
                    Button {
//                        isSelected.toggle()
                    } label: {
                        Image(.infoIcn)
                    }
                    .padding(.top,3)
                    .padding(.trailing, 6)
                }
                .padding(.top,6)
                Divider()
            }
        }
        .onChange(of: focused) { _, newFocus in
            // Khi không còn field nào được focus → coi là “click ra ngoài”
            if newFocus == nil {
                onCommit(draft)
            }
        }
        .onSubmit {
            // Người dùng ấn Return trên bàn phím cũng commit
            onCommit(draft)
        }
        .padding(.vertical, 6)
    }
}
