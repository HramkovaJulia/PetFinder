//
//  Extension + UINavigationBar.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 21.12.2023.
//

import UIKit

extension UINavigationController {
    
    func setupNavBar() {
        let backBarItemColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) //BCE3FF
        let backImage = UIImage(systemName: "chevron.backward.circle.fill",
                                variableValue: 1, configuration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(backBarItemColor,
                                    renderingMode: .alwaysOriginal)
        let appearance = UINavigationBar.appearance()
//        appearance.topItem?.backBarButtonItem = UIBarButtonItem(title: "",
//                                                                style: .plain,
//                                                                target: nil,
//                                                                action: nil)
        appearance.backIndicatorImage = backImage
        appearance.backIndicatorTransitionMaskImage = backImage
                
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        
    }
}
