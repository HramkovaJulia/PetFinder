//
//  SceneDelegate.swift
//  PetFinder
//
//  Created by Julia on 15.10.2023.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        
        //        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        //        self.window?.windowScene = windowScene
        
        //        let homeVC = OnboardingViewController()
        //
        //        let navController = UINavigationController(rootViewController: homeVC)
        //        navController.navigationBar.isHidden = true
        //        self.window?.rootViewController = navController
        //        self.window?.makeKeyAndVisible()
        //
        let startView = StartView()
        
        let window = UIWindow(windowScene: windowScene)
        window.frame = windowScene.coordinateSpace.bounds
        window.rootViewController = UIHostingController(rootView: startView)
        
        self.window = window
        
        self.window?.makeKeyAndVisible()
        
        
    }
}

