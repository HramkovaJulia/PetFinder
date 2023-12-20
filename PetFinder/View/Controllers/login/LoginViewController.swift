//
//  LoginController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let emailLabel = HeaderTextLabel(title: "Телефон или почта*")
    private let emailOrPhoneFieild = CustomTextField(fieldType: .email)
    
    private let passwordLabel = HeaderTextLabel(title: "Пароль*")
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let forgotPassword = CustomButton(title: "Забыли пароль?", hasBackground: false, height: 20)
    
    private let googleLoginButton = CustomLoginButton(button: .google)
    private let appleLoginButton = CustomLoginButton(button: .appleId)
    
    
//    private let signInButton = CustomButton(title: "Войти", hasBackground: true, fontSize: .lowerButton)
//    private let newUserButton = CustomButton(title: "Зарегистрироваться", fontSize: .mid)
//    private let forgotPasswordButton = CustomButton(title: " Забыли пароль?", fontSize: .small)
//    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = #colorLiteral(red: 0.9647513032, green: 0.87118572, blue: 0.7860397696, alpha: 1)
        
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailOrPhoneFieild)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordField)
        self.view.addSubview(forgotPassword)
        self.view.addSubview(googleLoginButton)
        self.view.addSubview(appleLoginButton)
        
        //MARK: - constrains
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(5)
        }
        
        emailOrPhoneFieild.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            //исправить offset 24
            make.top.equalTo(emailLabel.snp.bottom).offset(34)
            
        }
        
    }
}
