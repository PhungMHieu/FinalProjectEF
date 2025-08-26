//
//  TagV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import SwiftUI

struct TagV: View {
    @Binding var tags: [String]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let tagV = ["Học tập", "Công việc", "Thói quen", "Sức khoẻ"]
        let colors:[Color] = [.accent, .warning, .low, .primaryApp]
        let columns = [GridItem(.adaptive(minimum: 84), spacing: 12, alignment: .center)]
        
        NavigationStack {
            VStack(spacing:0) {
                ScrollView {
                    LazyVGrid(columns: columns,spacing:12) {
                        ForEach(Array(tagV.enumerated()), id: \.element) { index, tag in
                            TagComponentV(
                                tag: tag,
                                color: colors[index % colors.count] // gán màu theo vòng lặp
                            )
                        }
                    }
                }
                .padding(.vertical,16)
                .background(.neutral5)
                .cornerRadius(12)
                .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding(16)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        print("Edit tapped")
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        print("Edit tapped")
                        dismiss()
                    }
                }
                ToolbarItem (placement: .principal){
                    Text("New reminder")
                        .font(.system(size: 17,weight: .semibold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.backgroundRemindersAdd)
        }
    }
}
