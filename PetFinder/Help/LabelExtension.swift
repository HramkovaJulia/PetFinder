//
//  LabelExtension.swift
//  PetFinder
//
//  Created by Julia on 06.02.2024.
//

import UIKit

open class PFLabel: UILabel {

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
        font = PFFontFamily.SFProText.medium.font(size: 16)
        textColor = .black
        
    }

}

