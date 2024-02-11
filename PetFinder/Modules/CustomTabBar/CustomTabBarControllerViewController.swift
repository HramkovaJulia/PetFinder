//
//  CustomTabBarControllerViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.10.23.
//

import UIKit
import SnapKit
import SwiftUI
//import STTabbar

class CustomTabBarControllerViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabBar()
        setupTabBar()
        configureTabBar()
        
    }

    func setupCustomTabBar() {
        let customTabBar = STTabbar()
        setValue(customTabBar, forKey: "tabBar")
        customTabBar.centerButtonColor = UIColor(hex: 0x8965C3, alpha: 1)
        customTabBar.buttonImage = PFAssets.createAd.image
        customTabBar.centerButtonHeight = 48
        customTabBar.padding = 5
        customTabBar.tabbarColor = UIColor(hex: 0xfcfcfc, alpha: 1)
        customTabBar.unselectedItemColor = UIColor(hex: 0x8d8d8d, alpha: 1)
//        customTabBar.centerButtonAction(sender: UIButton())
    }

    
    func setupTabBar() {
        let profileView = ProfileSwiftUIView()
        let hostingController = UIHostingController(rootView: profileView)
        
        let mainViewController = setupVC(viewController: MainViewController(), title: "Объявления", image:  setupImage(named: PFAssets.clipboard.image))
        let createViewController = setupVC(viewController: ServicesViewController(), title: "Сервисы", image: setupImage(named: PFAssets.services.image))
        let nocreateViewController = setupVC(viewController: UIViewController(), title: "", image: nil)
        let profileViewController = setupVC(viewController: UIViewController(), title: "Избранное", image: setupImage(named: PFAssets.heart.image))
        let createViewControllerS = setupVC(viewController: hostingController, title: "Профиль", image: setupImage(named: PFAssets.profile.image))
        
        // Ограничиваем количество отображаемых контроллеров в таб-баре
        let visibleViewControllers = [mainViewController, createViewControllerS]
        viewControllers = visibleViewControllers
    }
    
    func setupImage(named: UIImage) -> UIImage? {
            return UIImage(cgImage: (named.cgImage!), scale: 12, orientation: named.imageOrientation)
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let font = UIFont.sfProText(ofSize: 10, weight: .regular)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]

        viewController.tabBarItem.title = title
        viewController.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        viewController.tabBarItem.image = image
        return viewController
    }
    
    func configureTabBar() {
        tabBar.tintColor = UIColor(hex: 0x8965C3, alpha: 1)
        tabBar.backgroundColor = UIColor(hex: 0xfcfcfc, alpha: 1)
    }
    
    @objc
    func addTarget() {
    }
}
