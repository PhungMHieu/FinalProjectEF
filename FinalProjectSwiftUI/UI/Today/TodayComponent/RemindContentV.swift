//
//  RemindContentV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct RemindContentV: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack{
                Image(.ratio)
                    .padding(.top,1)
            }
            VStack(spacing:6) {
                TextField(text: .constant("")) {
                    Text("First one")
                }
                TextField(text: .constant("")) {
                    Text("Reminders")
                }
            }
            .padding(.top,6)
        }
        
    }
}

#Preview {
    RemindContentV()
}
