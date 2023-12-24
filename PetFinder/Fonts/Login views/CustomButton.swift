//
//  CustomButton.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit

class CustomButton: UIButton {

    init(title: String, hasBackground: Bool = false) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 22
        self.layer.masksToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    
        switch hasBackground {
        case true:
            //MARK: - Setup BackgroundColor for button
            self.backgroundColor = #colorLiteral(red: 1, green: 0.5921106339, blue: 0.3732565343, alpha: 1)
            // apply shadow
            self.layer.masksToBounds = false
            self.layer.shadowOpacity = 0.4
            self.layer.shadowRadius = 3.0
            
            self.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowColor = UIColor.black.cgColor //Any dark color
            self.setTitleColor(.white, for: .normal)
                        
        case false:
            self.backgroundColor = .clear
            self.setTitleColor ( #colorLiteral(red: 1, green: 0.5921106339, blue: 0.3732565343, alpha: 1), for: .normal)
       
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

