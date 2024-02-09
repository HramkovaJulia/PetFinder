//
//  ForgotPasswordViewController.swift
//  PetFinder
//
//  Created by Julia on 06.02.2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        setupUI()
        makeConstraints()
    }

    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Восстановление пароля"
        mainLabel.font = PFFontFamily.SFProText.semibold.font(size: 24)
        mainLabel.textColor = .black
        return mainLabel
    }()

    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backspaceButton"), for: .normal)
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    @objc func closeViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Телефон и почта*"
        label.font = PFFontFamily.SFProText.medium.font(size: 16)
        return label
    }()

    private lazy var contactTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ivanov@example.com"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        textField.layer.cornerRadius = 25
        textField.backgroundColor = .white
        textField.layer.shadowColor = PFAssets.lightGray.color.cgColor
        textField.layer.shadowRadius = 8
        textField.layer.shadowOpacity = 0.06
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = PFAssets.lightGray.color.cgColor

        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: PFFontFamily.SFProText.light.font(size: 14),
            .foregroundColor: UIColor.gray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Ivanov@example.com", attributes: placeholderAttributes)

        return textField
    }()

    private var stackViewLogin: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private lazy var accessButton: UIButton = {
        let button = UIButton()
        let title = "Нет доступа?"

        // Создайте атрибутированную строку с подчеркнутым текстом
        let attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: PFFontFamily.SFProText.regular.font(size: 14),
            NSAttributedString.Key.foregroundColor: UIColor.blue,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])

        // Установите атрибутированный текст на кнопку
        button.setAttributedTitle(attributedTitle, for: .normal)

        // Установите обработчик нажатия на кнопку
        button.addTarget(self, action: #selector(accessButtonTapped), for: .touchUpInside)

        return button
    }()

    private lazy var sendCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить код", for: .normal)
        button.titleLabel?.font = PFFontFamily.SFProText.semibold.font(size: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = PFAssets.darkBeige.color
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1

           button.addTarget(self, action: #selector(sendCodeTapped), for: .touchUpInside)
           return button
    }()

    @objc func accessButtonTapped() {
    }

    @objc func sendCodeTapped() {

    }

    private func setupUI() {
        self.view.backgroundColor = PFAssets.background.color
        contactTextField.delegate = self
        view.addSubview(leftButton)
        view.addSubview(mainLabel)
        view.addSubview(stackViewLogin)
        stackViewLogin.addArrangedSubview(nameLabel)
        stackViewLogin.addArrangedSubview(contactTextField)
        view.addSubview(accessButton)
        view.addSubview(sendCodeButton)
    }

    private func  makeConstraints() {

        leftButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(61)
            maker.left.equalToSuperview().inset(16)
        }

        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(62)
            maker.left.equalTo(leftButton.snp.right).offset(14)
        }

        contactTextField.snp.makeConstraints { make in
            make.height.equalTo(54)
        }

        stackViewLogin.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(82)
        }

        accessButton.snp.makeConstraints { make in
            make.top.equalTo(stackViewLogin.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }

        sendCodeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(34)
            make.height.equalTo(62)
        }
    }

}

extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.layer.borderColor = textField.text?.isEmpty == true ? PFAssets.lightGray.color.cgColor : PFAssets.darkBlue.color.cgColor
        sendCodeButton.backgroundColor = textField.text?.isEmpty == true ? PFAssets.beige.color : PFAssets.ginger.color
    }
}
