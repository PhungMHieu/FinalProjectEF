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

            HStack(spacing:0) {
                Spacer()
                Image(systemName: "arrow.up.arrow.down.circle.fill")
                    .padding(.trailing, 0)
                    .frame(width: 26, height: 26)
            }
            .padding(.trailing, 18)
        }
        .frame(height: 24)
    }
}
