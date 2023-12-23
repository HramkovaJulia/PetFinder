//
//  RecoveryMessageCodeViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 22.12.2023.
//

import UIKit
import SnapKit

class RecoveryMessageCodeViewController: UIViewController {
    
    //MARK: - UI Components
    private let recievedCodeLabel = HeaderTextLabel(title: "Полученный код")
    private let recievedCodeField = CustomTextField(fieldType: .smsverification)
    
    private let sendCodeAgain = CustomRecoveryButton(style: .sendCodeAgain)
    private let continiue = CustomButton(title: "Далее", hasBackground: true)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Восстановление пароля"
        
        self.continiue.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
        setupUI()

    }
    //MARK: - Setup UI
        private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.view.addSubview(recievedCodeLabel)
        self.view.addSubview(recievedCodeField)
        self.view.addSubview(sendCodeAgain)
        self.view.addSubview(continiue)
        
        //MARK: - constrains
        recievedCodeLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        recievedCodeField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(recievedCodeLabel.snp.bottom).offset(24)
        }
        sendCodeAgain.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //TODO: setup constraint after adding timer
            make.top.equalTo(recievedCodeField.snp.bottom).offset(52)
        }
        continiue.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-29)
        }
    }
  
    //MARK: - selectors
    @objc private func didTapContinue() {
        print("DEBUG :", "didTapContinue")
        let vc = RecoveryNewPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}
