//
//  CustomTextFiled.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case username
        case email
        case smsverification
        case password
    }
    private let authFieldType: CustomTextFieldType
    private let rightEyeButton: UIButton = {
        
        let rightEyeButton = UIButton()
        rightEyeButton.setImage(UIImage(systemName: "eye.slash",
                                            variableValue: 0,
                                            configuration: UIImage.SymbolConfiguration(
                                            weight: .light))?
                                            .withTintColor(.secondaryLabel,
                                            renderingMode: .alwaysOriginal), for: .normal)
         
        return rightEyeButton
    }()
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.clearButtonMode = .whileEditing
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 22
        //TODO: Font set
        self.font = .systemFont(ofSize: 14, weight: .light)
        self.setupRightImageView()

        
        //to apply Shadow
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowColor = UIColor.black.cgColor //Any dark color

        //to apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        switch authFieldType {
        case .username:
            self.placeholder = "Иванов Иван Иванович"
            self.autocapitalizationType = .words
            
        case .email:
            self.placeholder = "Ivanov@example.com"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .smsverification:
            self.placeholder = ""
            self.keyboardType = .decimalPad
            self.textContentType = .password
            
        case .password:
            self.placeholder = ""
            self.isSecureTextEntry = true
            self.textContentType = .oneTimeCode
            self.textContentType = .password
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup ui hide/show button
    private func setupRightImageView(){
        // выставить кнопку width
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
        rightView.backgroundColor = .blue
    
        // выставить кнопку width
        rightEyeButton.frame = CGRect(x: -4, y: 12, width: 25, height: 25)
        rightView.addSubview(rightEyeButton)
    
        rightEyeButton.addTarget(self, action: #selector(showOrHidePassword), for: .touchUpInside)
        
        //to apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
        self.rightView = rightView
        
    }
    
    @objc func showOrHidePassword(){
            print("DEBUG: show/hide password button pressed")
        if isSecureTextEntry {
            rightEyeButton.setImage(UIImage(systemName: "eye", variableValue: 0, configuration: UIImage.SymbolConfiguration(weight: .light))?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            rightEyeButton.setImage(UIImage(systemName: "eye.slash", variableValue: 0, configuration: UIImage.SymbolConfiguration(weight: .light))?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal), for: .normal)
        }
            isSecureTextEntry = !isSecureTextEntry
        }
}

