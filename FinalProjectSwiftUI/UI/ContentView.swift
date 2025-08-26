//
//  ContentView.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var searchText: String = ""
    @State var presentSheet: Bool = false
    @State private var items = ["Apple", "Banana", "Orange", "Grape"]
    
    @StateObject private var viewModel = ReminderVM()
    //    @StateObject private var items =.
    
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
//                    Section {
//                        ForEach(viewModel.reminders) { item in
//                            RemindContentV(title: item.title)
//                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//                                    Button(role: .destructive) {
////                                        if let index = items.firstIndex(of: item) {
////                                            items.remove(at: index)
////                                        }
//                                    } label: {
//                                        Label("Delete", systemImage: "trash")
//                                    }
//                                }
//                        }
//                    } header: {
//                        Text("Today")
//                            .frame(height: 26)
//                            .font(.system(size: 22, weight: .bold))
//                            .foregroundStyle(.neutral1)
//                    }
//                    .listRowInsets(EdgeInsets())
//                    .listRowSeparator(.hidden)
                    Section {
                        ForEach(viewModel.reminders) { item in
                            //                            RemindCon
                            RemindContentV(title:item.title)
                            //                            RemindContentV()
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button(role: .destructive) {
//                                        if let index = items.firstIndex(of: item) {
//                                            items.remove(at: index)
//                                        }
                                    } label: {
                                        Text("Delete")
                                            .foregroundStyle(.neutral5)
                                    }
                                }
                        }
                    } header: {
                        Text("Upcoming")
                            .frame(height: 26)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.neutral1)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
                //                .padding(.top, -25+12)
                .padding(.horizontal,16)
                //                .background(.yellow)
                .scrollContentBackground(.hidden)
                //                .listSectionSpacing(12)
                Spacer()
                RemindContentV(title: "")
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
                    BottomBarV(isShowPresent : $presentSheet, items: $items)
                }
                ToolbarItem (placement: .principal){
                    Text("Reminders")
                        .font(.system(size: 20,weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.neutral5)
            .sheet(isPresented: $presentSheet, content: {
                RemindersAddV()
            })
        }
        .environmentObject(viewModel)
    }
}
//#Preview {
//    ContentView()
//}
