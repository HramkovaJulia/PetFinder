//
//  ColorCollectionViewCell.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 12.01.24.
//

import UIKit
import SnapKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    private var widthConstraint: Constraint?

    lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.text = "Цвет"
        colorLabel.font = UIFont.sfProText(ofSize: 14, weight: .semiBold)
        colorLabel.textAlignment = .center
        return colorLabel
    }()

    private lazy var plusImage: UIImageView = {
        let plusImage = UIImageView()
        plusImage.image = UIImage(named: "plusImage")
        return plusImage
    }()
    
//    func setupUI() {
//        self.addSubview(colorLabel)
//    }
//    
    func makeConstraints() {
        colorLabel.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    func createUI(text: String) {
//        setupUI()
//        makeConstraints()
        
        self.backgroundColor = UIColor(hex: 0xFFFDFA, alpha: 1)
        self.layer.cornerRadius = 17
        
        if text == "+" {
            self.addSubview(plusImage)
            plusImage.snp.makeConstraints { maker in
                maker.top.left.equalToSuperview().inset(10)
                maker.right.bottom.equalToSuperview().inset(9)
            }
        } else {
            colorLabel.text = text
            colorLabel.textColor = .black
            self.addSubview(colorLabel)
            colorLabel.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
        }
    }
    
    func selectedCell() {
        colorLabel.textColor = .white
    }
}
