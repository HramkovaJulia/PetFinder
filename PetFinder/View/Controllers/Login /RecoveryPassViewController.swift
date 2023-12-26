//
//  RecoveryPassViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 21.12.2023.
//

import UIKit
import SnapKit

final class RecoveryPassViewController: UIViewController {
    
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
    
    private let emailLabel = HeaderTextLabel(title: "Телефон или почта*")
    private let emailOrPhoneField = CustomTextField(fieldType: .email)
    
    private let dontHaveAccess = CustomRecoveryButton(style: .dontHaveAccess)
    private let sendRecoveryCode = CustomButton(title: "Отправить код", hasBackground: true)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sendRecoveryCode.addTarget(self, action: #selector(didTapSendPinCode), for: .touchUpInside)
        self.leftBackButton.addTarget(self, action: #selector(didTapGoBack), for: .touchUpInside)

        setupUI()

    }
    //MARK: - Setup UI
        private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
            
        self.view.addSubview(mainLabel)
        self.view.addSubview(leftBackButton)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailOrPhoneField)
        self.view.addSubview(dontHaveAccess)
        self.view.addSubview(sendRecoveryCode)
        
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
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(72)
        }
        
        emailOrPhoneField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(emailLabel.snp.bottom).offset(29)
        }
        dontHaveAccess.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(dontHaveAccess.titleLabel!.snp.right).offset(10)
            make.top.equalTo(emailOrPhoneField.snp.bottom).offset(10)
        }
        sendRecoveryCode.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-29)
        }
    }
    //MARK: - Selectors
    @objc private func didTapSendPinCode() {
        print("DEBUG :", "didTapSendPinCode")
        let vc = RecoveryMessageCodeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapGoBack() {
        print("DEBUG :", "back button pressed")
        self.navigationController?.popViewController(animated: true)
    }
}
