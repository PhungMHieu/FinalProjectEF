//
//  SwiftUINav.swift
//  FinalProjectSwiftUI
//
//  Created by Admin on 25/8/25.
//

import Foundation

//import SwiftUI
//import SwiftUI
//import UIKit
//
//// 1. UIViewControllerRepresentable để expose UINavigationController
//struct NavigationControllerAccessor: UIViewControllerRepresentable {
//    @Binding var navigationController: UINavigationController?
//    
//    func makeUIViewController(context: Context) -> UIViewController {
//        let vc = UIViewController()
//        DispatchQueue.main.async {
//            // Lấy UINavigationController hiện tại
//            self.navigationController = vc.navigationController
//        }
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}
////struct NewView: View {
////    var body: some View {
////        Text("Hello, World!")
////        Button {
////
////        } label: {
////            Text("Hello world")
////        }
////
////
////
////    }
////}
////struct ContentView: View {
////    @State private var navController: UINavigationController?
////
////        var body: some View {
////            NavigationStack {
////                VStack(spacing: 20) {
////                    NavigationLink("Go to Next Page") {
////                        Text("Next Page Hello worlds")
////                    }
////
////                    NavigationControllerAccessor(navigationController: $navController)
////                        .frame(width: 0, height: 0) // ẩn view, chỉ để lấy navController
////                }
////                .navigationTitle("Home")
////                .toolbar {
////                    ToolbarItem(placement: .bottomBar) {
////                        HStack {
////                            Button("Pop to Root") {
////                                navController?.popToRootViewController(animated: true)
////                            }
////                            Spacer()
////                            Button("Other Action") { }
////                        }
////                        .padding()
////                    }
////                }
////            }
////        }
////}
////
////#Preview {
////    ContentView()
////}
//import SwiftUI
//
//class AppRouter: ObservableObject {
//    @Published var navigationController: UINavigationController?
//}
//
//struct ContentView: View {
//    @StateObject var router = AppRouter()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Lấy navController
//                NavigationControllerAccessor(navigationController: $router.navigationController)
//                    .frame(width: 0, height: 0)
//                
//                Text("Màn A")
//                    .font(.largeTitle)
//                
//                Button("Đi tới màn B") {
//                    if let nav = router.navigationController {
//                        let vc = UIHostingController(rootView: ScreenB().environmentObject(router))
//                        nav.pushViewController(vc, animated: true)
//                    }
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Hello world")
//                        .foregroundStyle(.blue)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .background(.red)
//                }
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Trái") {
//                        router.navigationController?.popViewController(animated: true)
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Phải") {
//                        print("Bấm nút phải")
//                    }
//                }
//            }
//        }
//        .environmentObject(router)
//    }
//}
//
//struct ScreenB: View {
//    @EnvironmentObject var router: AppRouter
//    
//    var body: some View {
//        VStack {
//            Text("Màn B")
//                .font(.title)
//            
//            Button("Đi tới màn C") {
//                if let nav = router.navigationController {
//                    let vc = UIHostingController(rootView: ScreenC().environmentObject(router))
//                    nav.pushViewController(vc, animated: true)
//                }
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                Text("Hello world")
//                    .foregroundStyle(.blue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .background(.red)
//            }
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("Trái") {
//                    router.navigationController?.popViewController(animated: true)
//                }
//            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button("Phải") {
//                    print("Bấm nút phải")
//                }
//            }
//        }
//    }
//}
//
//struct ScreenC: View {
//    @EnvironmentObject var router: AppRouter
//    
//    var body: some View {
//        VStack {
//            Text("Màn C")
//                .font(.title)
//            
//            Button("màn D") {
//                if let nav = router.navigationController {
//                    let vc = UIHostingController(rootView: ScreenD().environmentObject(router))
//                    nav.pushViewController(vc, animated: true)
//                }
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("⬅︎") {
//                    router.navigationController?.popToRootViewController(animated: true)
//                }
//            }
//            ToolbarItem(placement: .principal) {
//                Text("Hello world")
//                    .foregroundStyle(.blue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            }
//        }
//        .navigationBarBackButtonHidden(true) // Ẩn nút Back mặc định
//    }
//}
//
//struct ScreenD: View {
//    @EnvironmentObject var router: AppRouter
//    
//    var body: some View {
//        VStack {
//            Text("Màn C")
//                .font(.title)
//            
//            Button("Quay lại màn A") {
//                router.navigationController?.popToRootViewController(animated: true)
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("⬅︎") {
//                    router.navigationController?.popViewController(animated: true)                }
//            }
//            ToolbarItem(placement: .principal) {
//                Text("Hello world")
//                    .foregroundStyle(.blue)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            }
//        }
//        .navigationBarBackButtonHidden(true) // Ẩn nút Back mặc định
//    }
//}
//extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
//    open override func viewDidLoad() {
//        super.viewDidLoad()
//        interactivePopGestureRecognizer?.delegate = self
//    }
//    
//    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        // Thay vì pop 1 màn, ta ép luôn về root
//        popToRootViewController(animated: true)
//        return false // Ngăn gesture mặc định (pop 1 màn)
//    }
//}
//#Preview {
//    ContentView()
//}
