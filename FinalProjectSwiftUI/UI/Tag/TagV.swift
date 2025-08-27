//
//  TagV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import SwiftUI

struct TagV: View {
    @Binding var tags: [ReminderTag]
    @Environment(\.dismiss) private var dismiss
//    @Binding var tagSelected: String
    let colors:[Color] = [.accent, .warning, .low, .primaryApp]
    let columns = [
        GridItem(.adaptive(minimum: 84, maximum: 84), spacing: 12, alignment: .center)
    ]
    
    var body: some View {
//        let tagV:[String] = ["Học tập", "Công việc", "Thói quen", "Sức khoẻ"]
        
        NavigationStack {
            VStack(spacing:0) {
                ScrollView {
                    LazyVGrid(columns: columns,spacing:12) {
                        ForEach(tags.indices, id: \.self) { i in
                            TagComponentV(tag:tags[i].name, color: colors[i], tagSelected: $tags[i].isSelected)
//                            TagComponentV(
//                                tag: tags[i],
//                                color: colors[i % colors.count],
//                                tagSelected: $tags[i].isSelected   // Binding tới phần tử mảng
//                            )
                        }
//                        ForEach($tags) { num in
//                            var tagState = tag.isSelected
//                            TagComponentV (isSelected: false, tag: tag, color: colors[0], tagSelected: .init())
//                        }
                        
//                        ForEach(Array(tags.enumerated()), id: \.element) { index, tag in
//                                                    }
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
