//
//  RegisterTableViewCell.swift
//  PetFinder
//
//  Created by Julia on 06.02.2024.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    static var identifier = "RegisterTableViewCell"
    
    private let label: PFLabel = {
        let label = PFLabel()
        return label
    }()
    
    let textField: PFTextField = {
        let textField = PFTextField()
       
        return textField
    }()
    
    
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
        contentView.addSubview(label)
        contentView.addSubview(textField)
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(6)
            make.height.equalTo(19)
        }
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.height.equalTo(53)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func config(label: String, placeholder: String) {
        self.label.text = label
        self.textField.placeholderText = placeholder
    }
    
}

extension RegisterTableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.layer.borderColor = textField.text?.isEmpty == true ? PFAssets.lightGray.color.cgColor : PFAssets.darkBlue.color.cgColor
    }
}
