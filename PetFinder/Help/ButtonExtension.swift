//
//  ButtonExtension.swift
//  PetFinder
//
//  Created by Julia on 07.02.2024.
//

import UIKit

open class PFButton: UIButton {

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    // MARK: - Setup

    private func setup() {
        titleLabel?.font = PFFontFamily.SFProText.semibold.font(size: 18)

        layer.cornerRadius = 25
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }

}

