//
//  AnimalCollectionViewCell.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.10.23.
//

import UIKit
import SnapKit

final class AnimalCollectionViewCell: UICollectionViewCell {
    
    private lazy var labelText: UILabel = {
        let labelText = UILabel()
        labelText.font = UIFont.sfProText(ofSize: 12, weight: .regular)
        labelText.textAlignment = .center
        labelText.textColor = .black
        return labelText
    }()
    
    private lazy var imageCell: UIImageView = {
        let imageCell = UIImageView()
        imageCell.contentMode = .scaleAspectFit
        return imageCell
    }()
    
    func createUI(text: String, imageName: String) {
        setup()
        makeConstaints()
        labelText.text = text
        switch imageName {
        case "dog":
            imageCell.image = PFAssets.dog.image
        case "cat":
            imageCell.image = PFAssets.cat.image
        case "bird":
            imageCell.image = PFAssets.bird.image
        case "mouse":
            imageCell.image = PFAssets.mouse.image
        case "others":
            imageCell.image = PFAssets.others.image
        default:
            imageCell.image = PFAssets.sortImage.image
        }
    }
    
    func setup() {
        self.layer.cornerRadius = 10
        self.addSubview(labelText)
        self.addSubview(imageCell)
    }
    
    func makeConstaints() {
        imageCell.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(1)
            maker.left.right.equalToSuperview()
            maker.height.width.equalTo(56)
        }
        
        labelText.snp.makeConstraints { maker in
            maker.top.equalTo(imageCell.snp.bottom).inset(-8)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
}
