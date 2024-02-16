//
//  ResponseViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.12.23.
//

import UIKit
import SnapKit
import SwiftUI

class ResponseViewController: UIViewController, UITextFieldDelegate {
    
    var heightConstraint: NSLayoutConstraint!
    
    
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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contenntView = UIView()
        return contenntView
    }()

    
    private lazy var responderInfo: UILabel = {
        let ownerInfo = UILabel()
        ownerInfo.text = "Ваши данные для связи"
        ownerInfo.font = PFFontFamily.SFProText.medium.font(size: 20)
        return ownerInfo
    }()
    
    private lazy var respondernameLabel: UILabel = {
       let respondernameLabel = UILabel()
        respondernameLabel.text = "ФИО*"
        respondernameLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return respondernameLabel
    }()
    
    private lazy var respondernameTextField: UIView = {
        let respondernameTextField = UIHostingController(rootView: CustomTextFieldView(text: "", placeholder: "Иванов Иван Иванович")).view
        respondernameTextField?.backgroundColor = .clear
        return respondernameTextField!
    }()
    
    private lazy var responderEmailLabel: UILabel = {
       let responderEmailLabel = UILabel()
        responderEmailLabel.text = "Почта"
        responderEmailLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return responderEmailLabel
    }()
    
    private lazy var responderEmailTextField: UIView = {
        let respondernameTextField = UIHostingController(rootView: CustomTextFieldView(text: "", placeholder: "Example@mail.com")).view
        respondernameTextField?.backgroundColor = .clear
        return respondernameTextField!
    }()
    
    
    private lazy var responderPhoneLabel: UILabel = {
       let responderPhoneLabel = UILabel()
        responderPhoneLabel.text = "Телефон"
        responderPhoneLabel.font = UIFont.sfProText(ofSize: 14, weight: .light)
        return responderPhoneLabel
    }()
    
    private lazy var responderPhoneTextField: UIView = {
        let responderPhoneTextField = UIHostingController(rootView: CustomTextFieldView(text: "", placeholder: "+7 (000) 000-00-00")).view
        responderPhoneTextField?.backgroundColor = .clear
        return responderPhoneTextField!
    }()
    
    
    private lazy var messageRespondLabel: UILabel = {
        let messageRespondLabel = UILabel()
        messageRespondLabel.text = "Сообщение владельцу"
        messageRespondLabel.font = PFFontFamily.SFProText.medium.font(size: 20)
        return messageRespondLabel
    }()
    
    private lazy var specialFeaturesField: UITextView = {
        let specialFeaturesField = UITextView()
        specialFeaturesField.isEditable = true
        specialFeaturesField.layer.cornerRadius = 20
        return specialFeaturesField
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
        heightConstraint = specialFeaturesField.heightAnchor.constraint(equalToConstant: 53)
        heightConstraint.priority = UILayoutPriority(rawValue: 999)
        heightConstraint.isActive = true
        
        self.view.backgroundColor = UIColor(dynamicProvider: PFAssets.background.color)
        self.view.addSubview(topView)
        self.topView.addSubview(mainLabel)
        self.topView.addSubview(rightButton)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(responderInfo)
        self.contentView.addSubview(respondernameLabel)
        self.contentView.addSubview(respondernameTextField)
        self.contentView.addSubview(responderEmailLabel)
        self.contentView.addSubview(responderEmailTextField)
        self.contentView.addSubview(responderPhoneLabel)
        self.contentView.addSubview(responderPhoneTextField)
        self.contentView.addSubview(messageRespondLabel)
        self.contentView.addSubview(specialFeaturesField)
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
        
        scrollView.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-5)
            maker.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.width.equalTo(scrollView)
            maker.height.equalTo(self.view)
        }

        responderInfo.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(19)
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
        
        messageRespondLabel.snp.makeConstraints { maker in
            maker.top.equalTo(responderPhoneTextField.snp.bottom).inset(-36)
            maker.left.equalToSuperview().inset(16)
        }
        
        specialFeaturesField.snp.makeConstraints { maker in
            maker.top.equalTo(messageRespondLabel.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
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

    func textFieldDidEndEditing(_ textField: UITextField) {
        if !textField.text!.isEmpty {
            textField.layer.borderColor = UIColor(dynamicProvider: PFAssets.blue.color).cgColor
            textField.layer.borderWidth = 1
        } else {
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.layer.borderWidth = 0
        }
    }
}

extension ResponseViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        // Установка минимальной высоты
        let minHeight: CGFloat = 53
        let calculatedHeight = max(minHeight, estimatedSize.height)
        heightConstraint.constant = calculatedHeight
    }
}

