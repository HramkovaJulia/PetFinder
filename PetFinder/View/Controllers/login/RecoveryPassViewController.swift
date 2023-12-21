//
//  RecoveryPassViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 21.12.2023.
//

import UIKit
import SnapKit

class RecoveryPassViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let emailLabel = HeaderTextLabel(title: "Телефон или почта*")
    private let emailOrPhoneFieild = CustomTextField(fieldType: .email)
    
    private let dontHaveAccess = CustomRecoverButton(style: .dontHaveAccess)
    private let sendPin = CustomButton(title: "Отправить код", hasBackground: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Восстановление пароля"
        setupUI()

    }
    //MARK: - Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailOrPhoneFieild)
        self.view.addSubview(dontHaveAccess)
        self.view.addSubview(sendPin)
        
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
        dontHaveAccess.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(emailOrPhoneFieild.snp.bottom).offset(10)
        }
        sendPin.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-34)
        }
    }

    // MARK: - Navigation

  

}
