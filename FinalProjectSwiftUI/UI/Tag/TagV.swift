//
//  TagV.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 26/8/25.
//

import SwiftUI

struct TagV: View {
    var body: some View {
        let tagV = ["Swift", "Kotlin", "Java", "Python"
        ]
        let columns = [GridItem(.adaptive(minimum: 80), spacing: 12)]
        
        NavigationStack {
            VStack(spacing:0) {
                ScrollView {
                    LazyVGrid(columns: columns,spacing:12) {
                        ForEach(tagV, id: \.self) { tag in
                            TagComponentV()
                        }
                    }
                }
                .padding(.vertical,16)
//                .padding(.horizontal,12)
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
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        print("Edit tapped")
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

//#Preview {
//    TagV()
//}
