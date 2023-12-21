//
//  SceneDelegate.swift
//  PetFinder
//
//  Created by Julia on 15.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        
        let homeVC = HomeViewController()
        
        let navigationController = UINavigationController(rootViewController: homeVC)
        //delete title from backButton
        navigationController.navigationBar.topItem?.backButtonTitle = ""
        
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

