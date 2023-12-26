//
//  RegisterController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit
import SnapKit

final class RegisterViewController: UIViewController {
    
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
        mainLabel.text = "Регистрация"
        return mainLabel
    }()
    
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
        
        self.signin.addTarget(self, action: #selector(didTapSignin), for: .touchUpInside)
        self.leftBackButton.addTarget(self, action: #selector(didTapGoBack), for: .touchUpInside)
        setupUI()
    }
        
    //MARK: - Setup UI
    private func setupUI() {
        
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        
        self.view.addSubview(mainLabel)
        self.view.addSubview(leftBackButton)
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
        leftBackButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(63)
            make.height.width.equalTo(32)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.left.equalTo(leftBackButton.snp.right).offset(12)
            make.top.equalToSuperview().inset(68)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(72)
        }
        
        userNameField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            //touching background offset is 19
            make.top.equalTo(userNameLabel.snp.bottom).offset(29)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(userNameField.snp.bottom).offset(18)
        }
        
        emailField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(emailLabel.snp.bottom).offset(29)
        }
        
        createPasswordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(emailField.snp.bottom).offset(18)
        }
        
        createPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(createPasswordLabel.snp.bottom).offset(29)
        }
        
        repeatPasswordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(createPasswordField.snp.bottom).offset(18)
        }
        
        repeatPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(29)
        }
        
        signin.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-29)
        }
            }
    //MARK: - Selectors
    @objc private func didTapSignin() {
        print("DEBUG :", "didTapSignin")
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapGoBack() {
        print("DEBUG :", "back button pressed")
        self.navigationController?.popViewController(animated: true)
    }
}
