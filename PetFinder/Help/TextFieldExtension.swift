//
//  TextFieldExtension.swift
//  PetFinder
//
//  Created by Julia on 06.02.2024.
//

import UIKit

class PFTextField: UITextField {

    var placeholderText: String?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    // MARK: - Setup

    private func setup() {
        font = PFFontFamily.SFProText.regular.font(size: 14)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 17))
        leftViewMode = .always
        layer.cornerRadius = 25
        layer.borderColor = PFAssets.lightGray.color.cgColor
        layer.borderWidth = 1
        backgroundColor = .white

        layer.shadowColor = PFAssets.lightGray.color.cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.06
        layer.shadowOffset = CGSize(width: 0, height: 4)

        if placeholderText != nil {
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .font: PFFontFamily.SFProText.light.font(size: 14),
                .foregroundColor: UIColor.gray
            ]
            attributedPlaceholder = NSAttributedString(string: "Ivanov@example.com", attributes: placeholderAttributes)
        }

    }
}
