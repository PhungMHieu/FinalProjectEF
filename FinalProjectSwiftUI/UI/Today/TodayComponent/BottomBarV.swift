//
//  BottomBarV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct BottomBarV: View {
    @Binding var isShowPresent:Bool
    @Binding var items:[String]
    var body: some View {
        HStack(spacing: 10) {
            Button {
//                isShowPresent.toggle()
                
            } label: {
                Image(.icAddReminder)
            }
            Text("New reminder")
                .foregroundStyle(.accent)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
        }
    }
}

#Preview {
//    BottomBarV(isShowPresent: .constant(true), items: .constant([]))
}
