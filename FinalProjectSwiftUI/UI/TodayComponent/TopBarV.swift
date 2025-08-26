//
//  TopBarV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct TopBarV: View {
    var body: some View {
        ZStack {
            Text("Reminders")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundStyle(.neutral1)

            HStack {
                Spacer()
                Image(systemName: "arrow.up.arrow.down.circle.fill")
                    .padding(.trailing, 9)
            }
        }
        .frame(height: 44) 
    }
}

#Preview {
    TopBarV()
}
