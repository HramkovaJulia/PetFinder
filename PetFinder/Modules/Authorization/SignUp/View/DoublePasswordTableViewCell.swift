//
//  PaswordTableViewCell.swift
//  PetFinder
//
//  Created by Julia on 07.02.2024.
//

import UIKit

class DoublePasswordTableViewCell: UITableViewCell {
    
    static var identifier = "DoublePasswordTableViewCell"
    
    var password1: String? = nil
    var password2: String? = nil
    var passwordDidChangeHandler: ((String?, String?) -> Void)?
    
    private let label1: PFLabel = {
        let label = PFLabel()
        return label
    }()
    
    private let label2: PFLabel = {
        let label = PFLabel()
        return label
    }()

    private let labelWrongPassword: UILabel = {
        let label = UILabel()
        label.text = "Пароли не совпадают"
        label.textColor = PFAssets.ginger.color
        label.isHidden = true
        label.font = PFFontFamily.SFProText.regular.font(size: 12)

        return label
    }()

    lazy var textField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.leftViewMode = .always
        textField.font = PFFontFamily.SFProText.regular.font(size: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 17))
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.layer.shadowColor = PFAssets.lightGray.color.cgColor
        textField.layer.shadowRadius = 8
        textField.layer.shadowOpacity = 0.06
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
        textField.rightViewMode = .always
        
        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 49, height: 22 + 2 * 5))
        rightViewContainer.addSubview(hideButton1)
        textField.rightView = rightViewContainer
        
        return textField
    }()
    
    lazy var textField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.leftViewMode = .always
        textField.font = PFFontFamily.SFProText.regular.font(size: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 17))
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.layer.shadowColor = PFAssets.lightGray.color.cgColor
        textField.layer.shadowRadius = 8
        textField.layer.shadowOpacity = 0.06
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
        textField.rightViewMode = .always
        
        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 49, height: 22 + 2 * 5))
        rightViewContainer.addSubview(hideButton2)
        textField.rightView = rightViewContainer
        
        return textField
    }()
    
    private lazy var hideButton1: UIButton = {
        let button = UIButton()
        let imageName = PFAssets.hide.name
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 5, y: 5, width: 24, height: 22)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(togglePasswordVisibility1), for: .touchUpInside)
        return button
    }()
    
    private lazy var hideButton2: UIButton = {
        let button = UIButton()
        let imageName = PFAssets.hide.name
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 5, y: 5, width: 24, height: 22)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(togglePasswordVisibility2), for: .touchUpInside)
        return button
    }()
    
    @objc private func togglePasswordVisibility1() {
        textField1.isSecureTextEntry.toggle()
        let imageName = textField1.isSecureTextEntry ? "show" : "hide"
        hideButton1.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc private func togglePasswordVisibility2() {
        textField2.isSecureTextEntry.toggle()
        let imageName = textField2.isSecureTextEntry ? "show" : "hide"
        hideButton2.setImage(UIImage(named: imageName), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setup(){
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        contentView.backgroundColor = PFAssets.background.color
        contentView.addSubview(label1)
        contentView.addSubview(textField1)
        contentView.addSubview(label2)
        contentView.addSubview(textField2)
        textField1.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField2.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contentView.addSubview(labelWrongPassword)
    }
    
    private func makeConstraints() {
        label1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(6)
            make.height.equalTo(19)
        }
        textField1.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(10)
            make.height.equalTo(54)
            make.leading.trailing.equalToSuperview()
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(6)
            make.height.equalTo(19)
        }
        textField2.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(10)
            make.height.equalTo(54)
            make.leading.trailing.equalToSuperview()
        }
        labelWrongPassword.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(6)
            make.height.equalTo(14)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func config(label1: String, label2: String, placeholder1: String, placeholder2: String) {
        self.label1.text = label1
        self.label2.text = label2
        self.textField1.placeholder = placeholder1
        self.textField2.placeholder = placeholder2
    }
    
    func updateTextFieldBorders(password1: String?, password2: String?) {
        if let password1 = password1, let password2 = password2 {
            if password1 == password2 {
                textField1.layer.borderColor = PFAssets.deepBlue.color.cgColor
                textField2.layer.borderColor = PFAssets.deepBlue.color.cgColor
                labelWrongPassword.isHidden = true
            } else {
                textField1.layer.borderColor = PFAssets.red.color.cgColor
                textField2.layer.borderColor = PFAssets.red.color.cgColor
                labelWrongPassword.isHidden = false
            }
        }
    }
    
}

extension DoublePasswordTableViewCell: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.layer.borderColor = textField.text?.isEmpty == true ? PFAssets.lightGray.color.cgColor : PFAssets.deepBlue.color.cgColor
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        password1 = textField1.text
        password2 = textField2.text
        passwordDidChangeHandler?(password1, password2)
    }
}

