//
//  BottomBarV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct BottomBarV: View {
    var onAdd: (() -> Void)?
    var body: some View {
        HStack(spacing: 10) {
            Button {
                onAdd?()
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
