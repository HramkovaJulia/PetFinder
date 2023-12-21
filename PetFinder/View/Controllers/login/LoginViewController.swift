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
    
    private let forgotPassword = CustomRecoverButton(style: .forgotPassword)
    
    private let googleLoginButton = CustomLoginButton(button: .google)
    private let appleLoginButton = CustomLoginButton(button: .appleId)
    
    //MARK: - Divider line
    private let deviderStackView: UIStackView = {
        
        let middleDivider = UITextField()
        middleDivider.text = "Или"
        middleDivider.font = UIFont.systemFont(ofSize: 12)
        middleDivider.textColor = .secondaryLabel
        middleDivider.textAlignment = .center
        
        let leftDivider = UILabel()
        leftDivider.text = "–"
        leftDivider.textColor = .secondaryLabel
        leftDivider.textAlignment = .right
        
        let rightDivider = UILabel()
        rightDivider.text = "–"
        rightDivider.textColor = .secondaryLabel
        rightDivider.textAlignment = .left
        
        let deviderStackView = UIStackView(arrangedSubviews: [leftDivider, middleDivider, rightDivider])
        deviderStackView.axis = .horizontal
        deviderStackView.alignment = .fill
        deviderStackView.distribution = .fillEqually
        deviderStackView.spacing = 5
        
        return deviderStackView
    }()
        private let login = CustomButton(title: "Войти", hasBackground: true)
        private let signin = CustomButton(title: "Зарегистрироваться", hasBackground: false)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Добро пожаловать"
        self.setupUI()
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailOrPhoneFieild)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordField)
        self.view.addSubview(forgotPassword)
        self.view.addSubview(deviderStackView)
        self.view.addSubview(googleLoginButton)
        self.view.addSubview(appleLoginButton)
        self.view.addSubview(login)
        self.view.addSubview(signin)
        
        //MARK: - constrains
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        emailOrPhoneFieild.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(emailLabel.snp.bottom).offset(24)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(emailOrPhoneFieild.snp.bottom).offset(24)
        }
        
        passwordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(passwordLabel.snp.bottom).offset(24)
        }
        
        forgotPassword.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(passwordField.snp.bottom).offset(10)
        }
        deviderStackView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(forgotPassword.snp.bottom).offset(32)
        }
        
        googleLoginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(passwordField.snp.height)
            make.top.equalTo(deviderStackView.snp.bottom).offset(32)
        }
        appleLoginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(passwordField.snp.height)
            make.top.equalTo(googleLoginButton.snp.bottom).offset(24)
        }
        login.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(passwordField.snp.height)
            //TODO: original size calc from top button not below
            make.bottom.equalTo(signin.snp.top).offset(-10)
        }
        signin.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(0)
        }
    }
}
