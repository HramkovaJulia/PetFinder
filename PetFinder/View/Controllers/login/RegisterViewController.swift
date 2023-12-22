//
//  RegisterController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let userNameLabel = HeaderTextLabel(title: "ФИО*")
    private let userNameField = CustomTextField(fieldType: .username)
    private let emailLabel = HeaderTextLabel(title: "Почта")
    private let emailField = CustomTextField(fieldType: .email)
    private let createPasswordLabel = HeaderTextLabel(title: "Придумайте пароль*")
    private let createPasswordField = CustomTextField(fieldType: .password)
    private let repeatPasswordLabel = HeaderTextLabel(title: "Повторите пароль*")
    private let repeatPasswordField = CustomTextField(fieldType: .password)
    private let signin = CustomButton(title: "Зарегистрироваться", hasBackground: true)
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    
    //MARK: - Setup UI
    private func setupUI() {
        
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Регистрация"
        
        self.view.addSubview(userNameLabel)
        self.view.addSubview(userNameField)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(createPasswordLabel)
        self.view.addSubview(createPasswordField)
        self.view.addSubview(repeatPasswordLabel)
        self.view.addSubview(repeatPasswordField)
        self.view.addSubview(signin)
        
        //MARK: - constrains
        userNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        userNameField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(userNameLabel.snp.bottom).offset(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(userNameField.snp.bottom).offset(24)
        }
        
        emailField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(emailLabel.snp.bottom).offset(24)
        }
        
        createPasswordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(emailField.snp.bottom).offset(24)
        }
        
        createPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(createPasswordLabel.snp.bottom).offset(24)
        }
        
        repeatPasswordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(createPasswordField.snp.bottom).offset(24)
        }
        
        repeatPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(24)
        }
        signin.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-24)
        }
        
    }

}
