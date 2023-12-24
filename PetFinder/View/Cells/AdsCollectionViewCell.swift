//
//  AdsTableViewCell.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 21.10.23.
//

import UIKit
import SnapKit

class AdsCollectionViewCell: UICollectionViewCell {
        
//    private lazy var petSignsLabelStack: UIStackView = {
//        let petSignsLabelStack = UIStackView()
//        petSignsLabelStack.distribution = .equalSpacing
//        petSignsLabelStack.spacing = 4
//        petSignsLabelStack.axis = .horizontal
//        petSignsLabelStack.layer.cornerRadius = 25
//        return petSignsLabelStack
//    }()
    
    private lazy var favorites: UIButton = {
        let favorites = UIButton()
        favorites.setImage(UIImage(named: "adsStar"), for: .normal)
        favorites.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        return favorites
    }()
    
    private lazy var markerImage: UIImageView = {
        let markerImage = UIImageView(image: UIImage(named: "mapPoint"))
        return markerImage
    }()
    
    private lazy var distanceLabel: UILabel = {
        let distanceLabel = UILabel()
        distanceLabel.font = UIFont.sfProText(ofSize: 14, weight: .regular)
        distanceLabel.attributedText = NSAttributedString(string: "1,4 км от вас", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return distanceLabel
    }()
    
    private lazy var imagePet: UIImageView = {
        let imagePet = UIImageView()
        imagePet.clipsToBounds = true

        let image = UIImage(named: "dog_back")
        imagePet.image = image
        imagePet.contentMode = .scaleToFill
        imagePet.backgroundColor = .clear
        imagePet.layer.cornerRadius = 12
        imagePet.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 12)
        return imagePet
    }()
    
    private lazy var typeAdsView : UIView = {
        let typeAdsView = UIView()
        typeAdsView.layer.cornerRadius = 12
        typeAdsView.backgroundColor = UIColor(hex: 0xfcfcfc, alpha: 1)
        return typeAdsView
    }()
    
    private lazy var typeAd: UIImageView = {
        let typeAd = UIImageView()
        typeAd.contentMode = .scaleAspectFill
        typeAd.clipsToBounds = true
        return typeAd
    }()
    
    private lazy var typeAdText: UILabel = {
        let typeAdText = UILabel()
        typeAdText.font = UIFont.sfProText(ofSize: 12, weight: .light)
        typeAdText.textColor = .black
        typeAdText.numberOfLines = 0
        return typeAdText
    }()
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.layer.cornerRadius = 12
        mainView.backgroundColor = UIColor(hex: 0xfcfcfc, alpha: 1)
        return mainView
    }()
    
    private lazy var labelAd: UILabel = {
        let labelAd = UILabel()
        labelAd.font = UIFont.sfProText(ofSize: 20, weight: .semiBold)
        labelAd.textColor = .black
        labelAd.lineBreakMode = .byTruncatingTail
        labelAd.numberOfLines = 0
        return labelAd
    }()

    private lazy var dateCreation: UILabel = {
        let dateCreation = UILabel()
        dateCreation.font = UIFont.sfProText(ofSize: 12, weight: .light)
        dateCreation.textColor = .black
        dateCreation.numberOfLines = 0
        dateCreation.text = "Вчера, 21:35"
        return dateCreation
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func createUI(data: [LostPetCard]) {
//        self.selectionStyle = .none
        self.backgroundColor = .clear
        labelAd.text = data[0].petName
        setup()
//        createPetSignsStack(data: data)
        makeConstraints()
        setupTypeAd(data: data[0].adType)
    }

    func setup() {
        contentView.addSubview(mainView)
        mainView.addSubview(labelAd)
        mainView.addSubview(dateCreation)
        mainView.addSubview(imagePet)
        mainView.addSubview(typeAdsView)
        typeAdsView.addSubview(typeAd)
        typeAdsView.addSubview(typeAdText)
        mainView.addSubview(markerImage)
        mainView.addSubview(distanceLabel)
        mainView.addSubview(favorites)
    }

    func createStackView(firsLabel: String, secondLabel: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(createStaticklabel(text: firsLabel, font: UIFont.sfProText(ofSize: 12, weight: .light), color: UIColor(hex: 0xD1713D, alpha: 1)))
        stackView.addArrangedSubview(createStaticklabel(text: secondLabel, font: UIFont.sfProText(ofSize: 14, weight: .light), color: UIColor(hex: 0x250404, alpha: 1)))
        
        return stackView
    }
    
    func createStaticklabel(text: String, font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textAlignment = .left
        label.textColor = color
        return label
    }

    func makeConstraints() {
        
        mainView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        imagePet.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview()
            maker.height.equalTo(148)
        }
        
        typeAdsView.snp.makeConstraints { maker in
            maker.right.equalTo(imagePet.snp.right).inset(8)
            maker.bottom.equalTo(imagePet.snp.bottom).inset(8)
//            maker.height.equalTo(22)
//            maker.width.equalTo(84)
        }
        
        typeAd.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview().inset(5)
            maker.left.equalToSuperview().inset(6)
            maker.width.height.equalTo(12)
        }
        
        typeAdText.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview().inset(4)
            maker.right.equalToSuperview().inset(6)
            maker.left.equalTo(typeAd.snp.right).inset(-4)
        }
        
        labelAd.snp.makeConstraints { maker in
            maker.top.equalTo(imagePet.snp.bottom).inset(-6)
            maker.left.right.equalToSuperview().inset(12)
            maker.height.equalTo(21)
        }

        dateCreation.snp.makeConstraints { maker in
            maker.top.equalTo(labelAd.snp.bottom).inset(-2)
            maker.left.right.equalToSuperview().inset(12)
        }
        
        markerImage.snp.makeConstraints { maker in
            maker.top.equalTo(dateCreation.snp.bottom).inset(-12)
            maker.left.equalToSuperview().inset(12)
            maker.bottom.equalToSuperview().inset(14)
        }
        
        distanceLabel.snp.makeConstraints { maker in
            maker.top.equalTo(dateCreation.snp.bottom).inset(-12)
            maker.left.equalTo(markerImage.snp.right).inset(-6)
            maker.bottom.equalToSuperview().inset(14)
        }
        
        favorites.snp.makeConstraints { maker in
            maker.top.equalTo(dateCreation.snp.bottom).inset(-10)
            maker.right.equalToSuperview().inset(12)
            maker.bottom.equalToSuperview().inset(14)
            maker.height.width.equalTo(20)
        }
    }
    
    @objc private func favoritesButtonTapped(sender: UIButton) {
        if let image = sender.imageView?.image, image == UIImage(named: "adsStar") {
            sender.setImage(UIImage(named: "adsStarFull"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "adsStar"), for: .normal)
        }
    }
    
    func setupTypeAd(data: TypeAd) {
        switch data {
        case .lost:
            typeAdText.text = "Потерян"
            let image = UIImage(named: "lost_image")
            typeAd.image = image
        case .found:
            typeAdText.text = "Найден"
            typeAd.tintColor = .green
            let image = UIImage(named: "lost_image")?.withTintColor(UIColor(hex: 0x24E120, alpha: 1), renderingMode: .alwaysOriginal)
            typeAd.image = image
        case .searched:
            typeAdText.text = "Ищет дом"
            typeAd.tintColor = .green
            let image = UIImage(named: "lost_image")?.withTintColor(UIColor(hex: 0xFF9C40, alpha: 1), renderingMode: .alwaysOriginal)
            typeAd.image = image
        }
    }
}
