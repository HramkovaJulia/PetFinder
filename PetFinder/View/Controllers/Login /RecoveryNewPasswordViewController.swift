//
//  RecoveryNewPasswordViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 22.12.2023.
//

import UIKit
import SnapKit


final class RecoveryNewPasswordViewController: UIViewController {
    
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
        mainLabel.text = "Восстановление пароля"
        return mainLabel
    }()
    
    private let newPasswordLabel = HeaderTextLabel(title: "Новый пароль*")
    private let newPasswordField = CustomTextField(fieldType: .password)
    private let repeatNewPasswordLabel = HeaderTextLabel(title: "Повторите пароль*")
    private let repeatNewPasswordField = CustomTextField(fieldType: .password)
    private let changePassword = CustomButton(title: "Изменить пароль", hasBackground: true)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changePassword.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
        self.leftBackButton.addTarget(self, action: #selector(didTapGoBack), for: .touchUpInside)
        
        setupUI()
    }
    //MARK: - Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.view.addSubview(leftBackButton)
        self.view.addSubview(mainLabel)
        self.view.addSubview(newPasswordLabel)
        self.view.addSubview(newPasswordField)
        self.view.addSubview(repeatNewPasswordLabel)
        self.view.addSubview(repeatNewPasswordField)
        self.view.addSubview(changePassword)
        
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
        newPasswordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(72)
        }
        newPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            //touching background offset is 19
            make.top.equalTo(newPasswordLabel.snp.bottom).offset(29)
        }
        repeatNewPasswordLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(newPasswordField.snp.bottom).offset(18)
        }
        repeatNewPasswordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(repeatNewPasswordLabel.snp.bottom).offset(29)
        }
        changePassword.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-29)
        }
    }
    //MARK: - Selectors
    @objc private func didTapContinue() {
        print("DEBUG :", "didTapContinue")
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapGoBack() {
        print("DEBUG :", "back button pressed")
        self.navigationController?.popViewController(animated: true)
    }
}
