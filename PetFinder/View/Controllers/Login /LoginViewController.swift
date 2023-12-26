//
//  LoginController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    //MARK: - UI Components
    lazy var leftBackButton: UIButton = {
        let leftBackButton = UIButton()
        leftBackButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
        return leftBackButton
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .label
        mainLabel.text = "Добро пожаловать"
        return mainLabel
    }()
    
    private let emailLabel = HeaderTextLabel(title: "Телефон или почта*")
    private let emailOrPhoneField = CustomTextField(fieldType: .email)
    
    private let passwordLabel = HeaderTextLabel(title: "Пароль*")
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let forgotPassword = CustomRecoveryButton(style: .forgotPassword)
    
    private let googleLoginButton = CustomLoginButton(button: .google)
    private let appleLoginButton = CustomLoginButton(button: .appleId)
    
    //MARK: - Divider line
    private let middleDivider: UITextField = {
        let middleDivider = UITextField()
        middleDivider.text = "Или"
        middleDivider.font = .sfProText(ofSize: 12, weight: .light)
        middleDivider.textColor = #colorLiteral(red: 0.5450980663, green: 0.5450980663, blue: 0.5450980663, alpha: 1)
        middleDivider.textAlignment = .center
        return middleDivider
    }()
    
    private let leftDivider: UIView = {
        let leftDivider = UIView()
        leftDivider.backgroundColor = .white
        leftDivider.layer.borderWidth = 1
        leftDivider.layer.borderColor = UIColor.white.cgColor
        return leftDivider
    }()
    
    private let rightDivider: UIView = {
        let rightDivider = UIView()
        rightDivider.backgroundColor = .white
        rightDivider.layer.borderWidth = 1
        rightDivider.layer.borderColor = UIColor.white.cgColor
        return rightDivider
    }()
    
    private let login = CustomButton(title: "Войти", hasBackground: true)
    private let signin = CustomButton(title: "Зарегистрироваться", hasBackground: false)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.forgotPassword.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        self.signin.addTarget(self, action: #selector(didTapSignin), for: .touchUpInside)
        self.leftBackButton.addTarget(self, action: #selector(didTapGoBack), for: .touchUpInside)
        
        self.setupUI()
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        
        self.view.addSubview(mainLabel)
        self.view.addSubview(leftBackButton)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailOrPhoneField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordField)
        self.view.addSubview(forgotPassword)
        self.view.addSubview(leftDivider)
        self.view.addSubview(middleDivider)
        self.view.addSubview(rightDivider)
        
        self.view.addSubview(googleLoginButton)
        self.view.addSubview(appleLoginButton)
        self.view.addSubview(login)
        self.view.addSubview(signin)
        
        //MARK: - constrains
        
        leftBackButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(63)
            make.height.width.equalTo(32)
        }
        mainLabel.snp.makeConstraints { make in
            make.left.equalTo(leftBackButton.snp.right).offset(12)
            make.top.equalToSuperview().inset(68)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(72)
        }
        
        emailOrPhoneField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(emailLabel.snp.bottom).offset(29)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(emailOrPhoneField.snp.bottom).offset(24)
        }
        
        passwordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(passwordLabel.snp.bottom).offset(29)
        }
        
        forgotPassword.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(forgotPassword.titleLabel!.snp.right).offset(10)
            make.top.equalTo(passwordField.snp.bottom).offset(10)
        }
        middleDivider.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotPassword.snp.bottom).offset(29)
        }
        leftDivider.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalTo(middleDivider.snp.left).inset(-6)
            make.top.equalTo(forgotPassword.snp.bottom).offset(29+8)
            make.height.equalTo(1)
        }
        rightDivider.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.left.equalTo(middleDivider.snp.right).inset(-6)
            make.top.equalTo(forgotPassword.snp.bottom).offset(29+8)
            make.height.equalTo(1)
        }
        
        googleLoginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(passwordField.snp.height)
            make.top.equalTo(middleDivider.snp.bottom).offset(29)
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
            make.bottom.equalToSuperview().offset(-24)
        }
    }
    
    //MARK: - Selectors
    
    @objc private func didTapGoBack() {
        print("DEBUG :", "back button pressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapForgotPassword() {
        print("DEBUG :", "didTapForgotPassword")
        let vc = RecoveryPassViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapSignin() {
        print("DEBUG :", "didTapSignin")
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

