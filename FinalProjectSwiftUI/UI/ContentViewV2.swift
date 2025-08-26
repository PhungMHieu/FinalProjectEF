//
//  ContentViewV2.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct ContentView2: View {
    @State var searchText: String = ""
    @State private var items = ["Apple", "Banana", "Orange", "Grape"]
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchBarV(searchText: $searchText)
                    .padding(.top,8)
                List {
                    Text("Today")
                        .frame(height: 26)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.neutral1)
                        .listRowInsets(EdgeInsets())
//                        .padding(.top,-26)
                    ForEach(filteredItems, id: \.self) { item in
                        Text(item)
                            .padding(0)
                    }
                    .listRowInsets(EdgeInsets())
//                    .listRowSeparator(.hidden)
                    Text("Upcoming")
                        .frame(height: 26)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.neutral1)
                        .listRowInsets(EdgeInsets())
//                        .listRowSeparator(.hidden)
                    
                    ForEach(filteredItems, id: \.self) { item in
                        Text(item)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
//                .listStyle()
//                .listStyle(.plain)
//                .padding(.horizontal,16)
                .padding(.top, 12)
//                .background(.yellow)
                .scrollContentBackground(.hidden)
                Spacer()
            }
            .toolbar {
                // Nút bên phải trên navigation bar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        print("Edit tapped")
                    }
                }

                // Nút bên dưới trái (bottom toolbar)
                ToolbarItem(placement: .bottomBar) {
//                    BottomBarV(isShowPresent: )
                }
                ToolbarItem (placement: .principal){
                    Text("Reminders")
                        .font(.system(size: 20,weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.red)
        }
    }
}
//#Preview {
//    ContentView2()
//}
