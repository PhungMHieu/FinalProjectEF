//
//  TagComponentV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import SwiftUI

struct TagComponentV: View {
    var tag: String
    let color: Color
    @Binding var tagSelected: Bool
    var body: some View {
        Button {
            tagSelected.toggle()
        } label: {
            Text(tag)
                .modifier(TagStyle(isSelected: tagSelected, color: color))
        }
    }
}

struct TagStyle: ViewModifier {
    let isSelected: Bool
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundStyle(.neutral5)
            .padding(.horizontal,8)
            .padding(.vertical,4)
            .background(isSelected ? color : .neutral3)
            .cornerRadius(8)
            .fixedSize(horizontal: true, vertical: false)
    }
}
