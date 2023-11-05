//
//  AdViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 4.11.23.
//

import UIKit
import SnapKit

class AdViewController: UIViewController {
    
    private let imageCollectionView = ImagesAdCollectionView()
    var pageControl = UIPageControl()
    var toogleShowText = true
    
    private lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backButton"), for: .normal)
        leftButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        leftButton.addTarget(self, action: #selector(closeAdViewController), for: .touchUpInside)
        return leftButton
    }()
    
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "favoriteButton"), for: .normal)
        rightButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        rightButton.addTarget(self, action: #selector(favoriteAdTapped), for: .touchUpInside)
        return rightButton
    }()
    
    private lazy var labelAd: UILabel = {
        let labelAd = UILabel()
        labelAd.font = UIFont.sfProText(ofSize: 20, weight: .semiBold)
        labelAd.text = "Джек"
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
    
    private lazy var typeAdStack : UIStackView = {
        let typeAdStack = UIStackView()
        typeAdStack.distribution = .fill
        typeAdStack.spacing = 2
        typeAdStack.axis = .vertical
        typeAdStack.alignment = .center
        return typeAdStack
    }()
    
    private lazy var typeAd: UIImageView = {
        let typeAd = UIImageView()
        let image = UIImage(named: "lost_image")
        typeAd.image = image
        typeAd.contentMode = .scaleAspectFill
        typeAd.clipsToBounds = true
        return typeAd
    }()
    
    private lazy var typeAdText: UILabel = {
        let typeAdText = UILabel()
        typeAdText.font = UIFont.sfProText(ofSize: 12, weight: .light)
        typeAdText.text = "Потерян"
        typeAdText.textColor = .black
        typeAdText.numberOfLines = 0
        return typeAdText
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.sfProText(ofSize: 18, weight: .medium)
        descriptionLabel.text = "Описание"
        descriptionLabel.textColor = .black
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var descriptionText: UILabel = {
        let labelAd = UILabel()
        labelAd.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        labelAd.text = "Пропал пёс в районе центрального рынка. На нём был красный ошейник с косточкой, откликается на кличку Джек, понимает много команд. Очень дружелюбный, ко всем подходит, любит давать лапу. Очень прошу помочь найти любимца"
        labelAd.textColor = .black
        labelAd.lineBreakMode = .byTruncatingTail
        labelAd.numberOfLines = 5
        return labelAd
    }()
    
    private lazy var showAllDescriptionText: UIButton = {
        let showAllDescriptionText = UIButton()
        showAllDescriptionText.setTitle("Показать полностью", for: .normal)
        showAllDescriptionText.titleLabel?.font = UIFont.sfProText(ofSize: 14, weight: .light)
        showAllDescriptionText.backgroundColor = .clear
        showAllDescriptionText.setTitleColor(UIColor(hex: 0x8D8D8D, alpha: 1), for: .normal)
        showAllDescriptionText.addTarget(self, action: #selector(showAllDescriptionTextTapped), for: .touchUpInside)
        return showAllDescriptionText
    }()
    
    private lazy var informationsAboutPet: UILabel = {
        let informationsAboutPet = UILabel()
        informationsAboutPet.font = UIFont.sfProText(ofSize: 18, weight: .medium)
        informationsAboutPet.text = "Информация о питомце"
        informationsAboutPet.textColor = .black
        informationsAboutPet.lineBreakMode = .byTruncatingTail
        informationsAboutPet.numberOfLines = 0
        return informationsAboutPet
    }()
    
    private lazy var petSignsLabelStack: UIStackView = {
        let petSignsLabelStack = UIStackView()
        petSignsLabelStack.distribution = .fill
        petSignsLabelStack.spacing = 4
        petSignsLabelStack.axis = .vertical
        return petSignsLabelStack
    }()
    
    private lazy var ownerInformation: UILabel = {
        let ownerInformation = UILabel()
        ownerInformation.font = UIFont.sfProText(ofSize: 18, weight: .medium)
        ownerInformation.text = "Информация о владельце"
        ownerInformation.textColor = .black
        ownerInformation.lineBreakMode = .byTruncatingTail
        ownerInformation.numberOfLines = 0
        return ownerInformation
    }()
    
    private lazy var respond: UIButton = {
        let respond = UIButton()
        respond.setTitle("Откликнуться", for: .normal)
        respond.titleLabel?.font = UIFont.sfProText(ofSize: 18, weight: .semiBold)
        respond.layer.cornerRadius = 35
        respond.backgroundColor = UIColor(hex: 0x11C7DB, alpha: 1)
        respond.setTitleColor(UIColor(hex: 0xfcfcfc, alpha: 1), for: .normal)
        return respond
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: 0xF9F6F3, alpha: 1)
        setupUI()
    }
    
    func setupUI() {
        setupPageControll()
        createTypeAdStack() 
        createPetSingsStack(data: ["Дворняга", "Рыжий", "Мальчик", "1.5 года"])
        setupView()
        setupConstaints()
    }
    
    //MARK: ButtonControll
    @objc func closeAdViewController() {
        self.dismiss(animated: true)
    }
    
    @objc func favoriteAdTapped(sender: UIButton) {
        if let image = sender.imageView?.image, image == UIImage(named: "favoriteButton") {
            let tintedImage = image.withTintColor(UIColor(hex: 0xFF9900, alpha: 1), renderingMode: .alwaysOriginal)
            sender.setImage(tintedImage, for: .normal)
        } else {
            sender.setImage(UIImage(named: "favoriteButton"), for: .normal)
        }
    }
    
    @objc func showAllDescriptionTextTapped(sender: UIButton) {
        if toogleShowText {
            descriptionText.numberOfLines = 0
            sender.setTitle("Скрыть", for: .normal)
            toogleShowText = false
        } else {
            descriptionText.numberOfLines = 5
            sender.setTitle("Показать польностью", for: .normal)
            toogleShowText = true
        }
        
    }
    
    
    private func setupPageControll() {
        imageCollectionView.didSelectItem = { number in
            self.pageControl.numberOfPages = number
        }
        
        imageCollectionView.didSelectItemWithPage = { [weak self] currentPage in
            DispatchQueue.main.async {
                self?.pageControl.currentPage = currentPage
            }
        }
        
        pageControl.currentPageIndicatorTintColor = UIColor(hex: 0x11C7DB, alpha: 1)
    }
    
    func createTypeAdStack() {
        typeAdStack.addArrangedSubview(typeAd)
        typeAdStack.addArrangedSubview(typeAdText)
        
    }
    
    func createPetSingsStack(data: [String]) {
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Порода: ", secondLabel: data[0]))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Окрас: ", secondLabel: data[1]))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Пол: ", secondLabel: data[2]))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Возраст: ", secondLabel: data[3]))
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
    
    func setupView() {
        self.view.addSubview(imageCollectionView)
        self.view.addSubview(rightButton)
        self.view.addSubview(leftButton)
        self.view.addSubview(pageControl)
        self.view.addSubview(labelAd)
        self.view.addSubview(dateCreation)
        self.view.addSubview(typeAdStack)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(descriptionText)
        self.view.addSubview(showAllDescriptionText)
        self.view.addSubview(informationsAboutPet)
        self.view.addSubview(petSignsLabelStack)
        self.view.addSubview(ownerInformation)
        self.view.addSubview(respond)
    }
    
    
    func setupConstaints() {
        imageCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide)
            maker.left.right.equalToSuperview().inset(14)
            maker.height.equalTo(293)
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.left.top.equalTo(imageCollectionView).inset(12)
            maker.height.width.equalTo(34)
        }
        
        rightButton.snp.makeConstraints { maker in
            maker.right.top.equalTo(imageCollectionView).inset(12)
            maker.height.width.equalTo(34)
        }
        
        pageControl.snp.makeConstraints { maker in
            maker.centerX.equalTo(imageCollectionView)
            maker.bottom.equalTo(imageCollectionView.snp.bottom).inset(12)
        }
        
        labelAd.snp.makeConstraints { maker in
            maker.top.equalTo(imageCollectionView.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.height.equalTo(22)
        }
        
        dateCreation.snp.makeConstraints { maker in
            maker.top.equalTo(labelAd.snp.bottom).inset(-4)
            maker.left.equalToSuperview().inset(16)
            maker.height.equalTo(14)
        }
        
        typeAd.snp.makeConstraints { maker in
            maker.height.width.equalTo(24)
        }
        
        typeAdStack.snp.makeConstraints { maker in
            maker.top.equalTo(imageCollectionView.snp.bottom).inset(-10)
            maker.right.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(dateCreation.snp.bottom).inset(-14)
            maker.left.equalToSuperview().inset(16)
        }
        
        descriptionText.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(18)
            maker.right.equalToSuperview().inset(20)
        }
        
        showAllDescriptionText.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionText.snp.bottom).inset(-7)
            maker.left.equalToSuperview().inset(16)
        }
        
        informationsAboutPet.snp.makeConstraints { maker in
            maker.top.equalTo(showAllDescriptionText.snp.bottom).inset(-14)
            maker.left.equalToSuperview().inset(16)
        }
        
        petSignsLabelStack.snp.makeConstraints { maker in
            maker.top.equalTo(informationsAboutPet.snp.bottom).inset(-9)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
        }
        
        ownerInformation.snp.makeConstraints { maker in
            maker.top.equalTo(petSignsLabelStack.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
        }
        
        respond.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(68)
        }
    }
}


