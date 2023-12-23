//
//  CustomLoginButton.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit

class CustomLoginButton: UIButton {

    enum FontType {
        case google
        case appleId
    }
    
    init(title: String = "", button: FontType) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 22
        self.layer.masksToBounds = true
        
//        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        // apply shadow
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
        
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowColor = UIColor.black.cgColor //Any dark color
        
        switch button {
        case .google:
            self.setTitle("Login with Google", for: .normal)
            self.backgroundColor = .white
            self.setTitleColor(.label, for: .normal)
           
        case .appleId:
            self.setTitle("Login with Apple", for: .normal) 
            self.backgroundColor = .black
            self.setTitleColor(.white, for: .normal)
            
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

