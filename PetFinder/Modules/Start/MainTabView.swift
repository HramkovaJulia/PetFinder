//
//  MainTabView.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 19.03.24.
//

import SwiftUI

struct MainTabView: View {
    @Binding var dataManager: DataManager
    var body: some View {
        CustomTabBarUIKit(dataManager: $dataManager).navigationBarHidden(true).ignoresSafeArea(.all)
    }
   
}

struct CustomTabBarUIKit: UIViewControllerRepresentable {
    @Binding var dataManager: DataManager
    func makeUIViewController(context: Context) -> CustomTabBarControllerViewController {
        return CustomTabBarControllerViewController(dataManager: $dataManager)
    }
    func updateUIViewController(_ uiViewController: CustomTabBarControllerViewController, context: Context) {}
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(dataManager: .constant(DataManager())) // Здесь можно передать любое значение DataManager
    }
}
