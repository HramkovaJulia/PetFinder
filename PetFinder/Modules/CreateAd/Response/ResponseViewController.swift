//
//  ResponseViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.12.23.
//

import UIKit
import SnapKit

class ResponseViewController: UIViewController {
    
    private lazy var topView: UIView = {
        let searchandNotificationView = UIView()
        searchandNotificationView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        return searchandNotificationView
    }()

    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Отправка отклика"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "closedButton"), for: .normal)
        rightButton.addTarget(self, action: #selector(closedVC), for: .touchUpInside)
        return rightButton
    }()
    
    private lazy var ownerInfo: UILabel = {
        let ownerInfo = UILabel()
        ownerInfo.text = "Контакты владельца объявления"
        ownerInfo.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        return ownerInfo
    }()
    
    private lazy var usernameLabel: UILabel = {
       let usernameLabel = UILabel()
        usernameLabel.text = "ФИО:"
        usernameLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return usernameLabel
    }()
    
    private lazy var userPhoneLabel: UILabel = {
       let userPhoneLabel = UILabel()
        userPhoneLabel.text = "Телефон:"
        userPhoneLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return userPhoneLabel
    }()
    
    private lazy var userEmailLabel: UILabel = {
       let userEmailLabel = UILabel()
        userEmailLabel.text = "Почта:"
        userEmailLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return userEmailLabel
    }()
    
    private lazy var username: UILabel = {
       let usernameLabel = UILabel()
        usernameLabel.text = "Иванов Иван Иванович"
        usernameLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        return usernameLabel
    }()
    
    private lazy var userPhone: UILabel = {
       let userPhoneLabel = UILabel()
        userPhoneLabel.text = "+7 (000) 000-00-00"
        userPhoneLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        return userPhoneLabel
    }()
    
    private lazy var userEmail: UILabel = {
       let userEmailLabel = UILabel()
        userEmailLabel.text = "Example@mail.com"
        userEmailLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        return userEmailLabel
    }()
    
    private lazy var responderInfo: UILabel = {
        let ownerInfo = UILabel()
        ownerInfo.text = "Ваши данные для связи"
        ownerInfo.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        return ownerInfo
    }()
    
    private lazy var respondernameLabel: UILabel = {
       let respondernameLabel = UILabel()
        respondernameLabel.text = "ФИО*"
        respondernameLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return respondernameLabel
    }()
    
    private lazy var respondernameTextField: UITextField = {
        let respondernameTextField = UITextField()
        respondernameTextField.placeholder = "Иванов Иван Иванович"
        respondernameTextField.leftViewMode = .always
        respondernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        respondernameTextField.layer.cornerRadius = 25
        respondernameTextField.layer.borderColor = UIColor(hex: 0x83CBFF, alpha: 1).cgColor
        respondernameTextField.layer.borderWidth = 1
        return respondernameTextField
    }()
    
    private lazy var responderEmailLabel: UILabel = {
       let responderEmailLabel = UILabel()
        responderEmailLabel.text = "Почта"
        responderEmailLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return responderEmailLabel
    }()
    
    private lazy var responderEmailTextField: UITextField = {
        let respondernameTextField = UITextField()
        respondernameTextField.placeholder = "Example@mail.com"
        respondernameTextField.leftViewMode = .always
        respondernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        respondernameTextField.layer.cornerRadius = 25
        respondernameTextField.layer.borderColor = UIColor(hex: 0x83CBFF, alpha: 1).cgColor
        respondernameTextField.layer.borderWidth = 1
        return respondernameTextField
    }()
    
    
    private lazy var responderPhoneLabel: UILabel = {
       let responderPhoneLabel = UILabel()
        responderPhoneLabel.text = "Телефон"
        responderPhoneLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return responderPhoneLabel
    }()
    
    private lazy var responderPhoneTextField: UITextField = {
        let respondernameTextField = UITextField()
        respondernameTextField.placeholder = "+7 (000) 000-00-00"
        respondernameTextField.leftViewMode = .always
        respondernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        respondernameTextField.layer.cornerRadius = 25
        respondernameTextField.layer.borderColor = UIColor(hex: 0x83CBFF, alpha: 1).cgColor
        respondernameTextField.layer.borderWidth = 1
        return respondernameTextField
    }()
    
    
    private lazy var respond: UIButton = {
        let respond = UIButton()
        respond.setTitle("Отправить", for: .normal)
        respond.titleLabel?.font = UIFont.sfProText(ofSize: 18, weight: .semiBold)
        respond.layer.cornerRadius = 35
        respond.backgroundColor = UIColor(hex: 0xFF975F, alpha: 1)
        respond.setTitleColor(UIColor(hex: 0xfcfcfc, alpha: 1), for: .normal)
        respond.addTarget(self, action: #selector(respondTapped), for: .touchUpInside)
        return respond
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeConstraints()
    }
    
    func setup() {
        self.view.backgroundColor = UIColor(hex: 0xfcfcfc)
        self.view.addSubview(topView)
        self.topView.addSubview(mainLabel)
        self.topView.addSubview(rightButton)
        self.view.addSubview(ownerInfo)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(userPhoneLabel)
        self.view.addSubview(userEmailLabel)
        self.view.addSubview(username)
        self.view.addSubview(userPhone)
        self.view.addSubview(userEmail)
        self.view.addSubview(responderInfo)
        self.view.addSubview(respondernameLabel)
        self.view.addSubview(respondernameTextField)
        self.view.addSubview(responderEmailLabel)
        self.view.addSubview(responderEmailTextField)
        self.view.addSubview(responderPhoneLabel)
        self.view.addSubview(responderPhoneTextField)
        self.view.addSubview(respond)
    }

    func makeConstraints() {
        topView.snp.makeConstraints { maker in
            maker.left.right.top.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(23)
        }
        
        rightButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        ownerInfo.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-24)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(17)
        }
        
        usernameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(ownerInfo.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(16)
        }
        
        userPhoneLabel.snp.makeConstraints { maker in
            maker.top.equalTo(usernameLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
        }
        
        userEmailLabel.snp.makeConstraints { maker in
            maker.top.equalTo(userPhoneLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
        }
        
        username.snp.makeConstraints { maker in
            maker.top.equalTo(ownerInfo.snp.bottom).inset(-16)
            maker.right.equalToSuperview().inset(16)
        }
        
        userPhone.snp.makeConstraints { maker in
            maker.top.equalTo(username.snp.bottom).inset(-10)
            maker.right.equalToSuperview().inset(16)
        }
        
        userEmail.snp.makeConstraints { maker in
            maker.top.equalTo(userPhone.snp.bottom).inset(-10)
            maker.right.equalToSuperview().inset(16)
        }
        
        responderInfo.snp.makeConstraints { maker in
            maker.top.equalTo(userEmail.snp.bottom).inset(-36)
            maker.left.equalToSuperview().inset(16)
        }
        
        respondernameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(responderInfo.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(16)
        }
        
        respondernameTextField.snp.makeConstraints { maker in
            maker.top.equalTo(respondernameLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        responderEmailLabel.snp.makeConstraints { maker in
            maker.top.equalTo(respondernameTextField.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
        }
        
        responderEmailTextField.snp.makeConstraints { maker in
            maker.top.equalTo(responderEmailLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        responderPhoneLabel.snp.makeConstraints { maker in
            maker.top.equalTo(responderEmailTextField.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
        }
        
        responderPhoneTextField.snp.makeConstraints { maker in
            maker.top.equalTo(responderPhoneLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        respond.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(68)
        }
    }
    
    @objc
    func closedVC() {
        self.dismiss(animated: true)
    }
    
    @objc
    func respondTapped() {
        let view = StatusRespondViewController()
        view.modalPresentationStyle = .overFullScreen
        self.present(view, animated: true)
       
    }

}
