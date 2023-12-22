//
//  AppDelegate.swift
//  PetFinder
//
//  Created by Julia on 15.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //MARK: - global navBar setup, for all VC
        let backBarItemColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) //BCE3FF
        let backImage = UIImage(systemName: "chevron.backward.circle.fill",
                                variableValue: 1, configuration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(backBarItemColor,
                                    renderingMode: .alwaysOriginal)
        
        let appearance = UINavigationBar.appearance()
        appearance.backIndicatorImage = backImage
        appearance.backIndicatorTransitionMaskImage = backImage
        appearance.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain,
                                                              target: nil,
                                                              action: nil)
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithTransparentBackground()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

