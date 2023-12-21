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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
        
         self.navigationBar.backIndicatorImage = UIImage(systemName: "chevron.backward.circle.fill", variableValue: 1, configuration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(backBarItemColor, renderingMode: .alwaysOriginal)
        
        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.backward.circle.fill", variableValue: 1, configuration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(backBarItemColor, renderingMode: .alwaysOriginal)
        
        self.navigationBar.topItem?.backButtonTitle = ""
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        //TODO: need to setup font
        self.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
    }
}
