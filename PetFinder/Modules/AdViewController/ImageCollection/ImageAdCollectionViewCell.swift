//
//  ImageAdCollectionViewCell.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 4.11.23.
//

import UIKit

class ImageAdCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.clipsToBounds = true

        let image = UIImage(named: "dog_back")
        mainImage.image = image
        mainImage.contentMode = .scaleToFill
        mainImage.backgroundColor = .clear
        return mainImage
    }()
    
    
    func setupUI() {
        self.layer.cornerRadius = 24
        setupImage()
    }
    
    private func setupImage() {
        self.addSubview(mainImage)
        
        mainImage.snp.makeConstraints { maker in
            maker.left.right.bottom.top.equalToSuperview()
        }
    }
}
