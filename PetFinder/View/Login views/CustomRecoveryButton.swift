//
//  SecondaryText.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomRecoveryButton: UIButton {
    
    enum buttonType {
        case forgotPassword
        case dontHaveAccess
        case sendCodeAgain
    }
    
    init(title: String = "", style: buttonType, hasBackground: Bool = false) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.sfProText(ofSize: 14, weight: .regular)
        self.layer.masksToBounds = true
        self.setTitleColor(.systemBlue, for: .normal)
        
        let myAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.sfProText(ofSize: 14, weight: .regular),
              .foregroundColor: UIColor.systemBlue,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        
//             myButton.setAttributedTitle(attributeString, for: .normal)
        
                switch style {
        case .forgotPassword:
            self.setTitle("Забыли пароль?", for: .normal)
            self.contentHorizontalAlignment = .left
        case .dontHaveAccess:
            let attributeString = NSMutableAttributedString(string: "Нет доступа?",
                                                            attributes: myAttributes)
            self.setAttributedTitle(attributeString, for: .normal)
            self.contentHorizontalAlignment = .left
        case .sendCodeAgain:
            let attributeString = NSMutableAttributedString(string: "Отправить код повторно",
                                                            attributes: myAttributes)
            self.setAttributedTitle(attributeString, for: .normal)
            self.contentHorizontalAlignment = .center
       
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
