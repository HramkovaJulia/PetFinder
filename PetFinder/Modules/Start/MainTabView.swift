//
//  MainTabView.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 19.03.24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        CustomTabBarUIKit().navigationBarHidden(true).ignoresSafeArea(.all)
    }
    struct CustomTabBarUIKit: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> CustomTabBarControllerViewController {
            return CustomTabBarControllerViewController()
        }
        func updateUIViewController(_ uiViewController: CustomTabBarControllerViewController, context: Context) {}
    }
}
#Preview {
    MainTabView()
}
