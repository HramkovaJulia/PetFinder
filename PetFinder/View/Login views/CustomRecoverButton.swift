//
//  SecondaryText.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomRecoverButton: UIButton {
    
    enum buttonType {
        case forgotPassword
        case dontHaveAccess
        case sendCodeAgain
    }
    
    init(title: String = "", style: buttonType, hasBackground: Bool = false) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        self.layer.masksToBounds = true
        self.setTitleColor(.systemBlue, for: .normal)
        
        switch style {
        case .forgotPassword:
            self.setTitle("Забыли пароль?", for: .normal)
            self.contentHorizontalAlignment = .left
        case .dontHaveAccess:
            self.setTitle("Нет доступа?", for: .normal)
            self.contentHorizontalAlignment = .left
        case .sendCodeAgain:
            self.setTitle("Отправить код повторно", for: .normal)
            self.contentHorizontalAlignment = .center
       
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
