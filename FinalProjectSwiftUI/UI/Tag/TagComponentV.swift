//
//  TagComponentV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import SwiftUI

struct TagComponentV: View {
    let tag: String
    let color: Color
    var body: some View {
        Text(tag)
            .font(.system(size: 16))
            .foregroundStyle(.neutral5)
            .padding(.horizontal,8)
            .padding(.vertical,4)
            .background(color)
            .cornerRadius(8)
            .fixedSize(horizontal: true, vertical: false)
    }
}
