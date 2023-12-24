//
//  AdViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 4.11.23.
//

import UIKit
import SnapKit
import MapKit

class AdViewController: UIViewController {
    
    private let imageCollectionView = ImagesAdCollectionView()
    var pageControl = UIPageControl()
    var toogleShowText = true
    private let dataModel: LostPetCard
    let currenPositionView: UIView
    
    init(viewModel: LostPetCard) {
        self.dataModel = viewModel
        self.currenPositionView = MapView(frame: CGRect.zero, defaultLatitude: dataModel.lastSeenLocation.0, defaultLongitude: dataModel.lastSeenLocation.1)

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView:UIScrollView = {
        let sc = UIScrollView(frame: .zero)
        return sc
    }()
    
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
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
    
    private lazy var currentPositionPetLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.sfProText(ofSize: 18, weight: .medium)
        descriptionLabel.text = "Адрес пропажи"
        descriptionLabel.textColor = .black
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var markerImage: UIImageView = {
        let markerImage = UIImageView()
        markerImage.image = UIImage(named: "mapPoint")
        return markerImage
    }()
    
    private lazy var streetLabel: UILabel = {
        let streetLabel = UILabel()
        streetLabel.font = UIFont.sfProText(ofSize: 14, weight: .regular)
        streetLabel.attributedText = NSAttributedString(string: "Малинина, 30", attributes:
                                                            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return streetLabel
    }()
    
    private lazy var distanceLabel: UILabel = {
        let distanceLabel = UILabel()
        distanceLabel.text = "1.4 км от вас"
        distanceLabel.font = UIFont.sfProText(ofSize: 12, weight: .regular)
        distanceLabel.textColor = UIColor(hex: 0xFF975F, alpha: 1)
        return distanceLabel
    }()
    
    private lazy var allScreenButton: UIButton = {
        let allScreenButton = UIButton()
        allScreenButton.setImage(UIImage(named: "allScreen"), for: .normal)
        allScreenButton.addTarget(self, action: #selector(allScreenButtonTapped), for: .touchUpInside)
        return allScreenButton
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
    
    private lazy var specialNotes: UILabel = {
        let ownerInformation = UILabel()
        ownerInformation.font = UIFont.sfProText(ofSize: 18, weight: .medium)
        ownerInformation.text = "Особые приметы"
        ownerInformation.textColor = .black
        ownerInformation.lineBreakMode = .byTruncatingTail
        ownerInformation.numberOfLines = 0
        return ownerInformation
    }()
    
    private lazy var specialNotesText: UILabel = {
        let specialNotes = UILabel()
        specialNotes.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        specialNotes.text = "Красный ошейник с золотой косточкой. На косточке написана кличка. Есть белое пятно на спине"
        specialNotes.textColor = .black
        specialNotes.lineBreakMode = .byTruncatingTail
        specialNotes.numberOfLines = 0
        return specialNotes
    }()
    
    private lazy var respond: UIButton = {
        let respond = UIButton()
        respond.setTitle("Откликнуться", for: .normal)
        respond.titleLabel?.font = UIFont.sfProText(ofSize: 18, weight: .semiBold)
        respond.layer.cornerRadius = 35
        respond.backgroundColor = UIColor(hex: 0x11C7DB, alpha: 1)
        respond.setTitleColor(UIColor(hex: 0xfcfcfc, alpha: 1), for: .normal)
        respond.addTarget(self, action: #selector(respondTapped), for: .touchUpInside)
        return respond
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor(hex: 0xF9F6F3, alpha: 1)
        setupUI()
    }
    
    func setupUI() {
        setupPageControll()
        createTypeAdStack()
        createPetSignsStack()
        setupView()
        setupConstaints()
        setupDataView()
        setupTypeAd()
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
    
    func createPetSignsStack() {
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Порода: ", secondLabel: dataModel.breed))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Окрас: ", secondLabel: dataModel.color))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Пол: ", secondLabel: dataModel.gender == .male ? "Мальчик" : "Девочка"))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Возраст: ", secondLabel: String(dataModel.age)))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Привит", secondLabel: dataModel.sterilised ? "Да" : "Нет"))
        petSignsLabelStack.addArrangedSubview(createStackView(firsLabel: "Стерилизован:", secondLabel: dataModel.sterilised ? "Да" : "Нет"))
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
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.bounds.size
        self.contentView.addSubview(imageCollectionView)
        self.contentView.addSubview(rightButton)
        self.contentView.addSubview(leftButton)
        self.contentView.addSubview(pageControl)
        self.contentView.addSubview(labelAd)
        self.contentView.addSubview(dateCreation)
        self.contentView.addSubview(typeAdStack)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(descriptionText)
        self.contentView.addSubview(showAllDescriptionText)
        self.contentView.addSubview(currentPositionPetLabel)
        self.contentView.addSubview(markerImage)
        self.contentView.addSubview(streetLabel)
        self.contentView.addSubview(distanceLabel)
        self.contentView.addSubview(currenPositionView)
        self.contentView.addSubview(allScreenButton)
        self.contentView.addSubview(informationsAboutPet)
        self.contentView.addSubview(petSignsLabelStack)
        self.contentView.addSubview(specialNotes)
        self.contentView.addSubview(specialNotesText)
        self.view.addSubview(respond)
    }
    
    func setupConstaints() {
        
        scrollView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide)
            maker.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.width.equalTo(scrollView)
//            maker.height.equalTo(self.view)
//            maker.height.equalTo(1400)
        }
        
        
        imageCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(scrollView)
            maker.left.right.equalToSuperview().inset(14)
            maker.height.equalTo(293)
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide).inset(8)
            maker.left.equalToSuperview().inset(25)
            maker.height.width.equalTo(34)
        }
        
        rightButton.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide).inset(8)
            maker.right.equalToSuperview().inset(25)
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
        
        currentPositionPetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(showAllDescriptionText.snp.bottom).inset(-36)
            maker.left.equalToSuperview().inset(16)
        }
        
        markerImage.snp.makeConstraints { maker in
            maker.top.equalTo(currentPositionPetLabel.snp.bottom).inset(-14)
            maker.left.equalToSuperview().inset(16)
        }
        
        streetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(currentPositionPetLabel.snp.bottom).inset(-15)
            maker.left.equalTo(markerImage.snp.right).inset(-6)
        }
        
        distanceLabel.snp.makeConstraints { maker in
            maker.top.equalTo(currentPositionPetLabel.snp.bottom).inset(-18)
            maker.right.equalToSuperview().inset(15)
        }

        currenPositionView.snp.makeConstraints { maker in
            maker.top.equalTo(currentPositionPetLabel.snp.bottom).inset(-44)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(115)
        }
        currenPositionView.layer.cornerRadius = 12
        currenPositionView.clipsToBounds = true
        
        
        allScreenButton.snp.makeConstraints { maker in
            maker.top.right.equalTo(currenPositionView).inset(8)
        }
        
        informationsAboutPet.snp.makeConstraints { maker in
            maker.top.equalTo(currenPositionView.snp.bottom).inset(-36)
            maker.left.equalToSuperview().inset(16)
        }
        
        petSignsLabelStack.snp.makeConstraints { maker in
            maker.top.equalTo(informationsAboutPet.snp.bottom).inset(-9)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
        }
        
        specialNotes.snp.makeConstraints { maker in
            maker.top.equalTo(petSignsLabelStack.snp.bottom).inset(-36)
            maker.left.equalToSuperview().inset(16)
        }
        
        specialNotesText.snp.makeConstraints { maker in
            maker.top.equalTo(specialNotes.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(100)
        }
        
        respond.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(68)
        }
    }
    
    func setupDataView() {
        labelAd.text = dataModel.petName
        dateCreation.text = dataModel.createPost
        descriptionText.text = dataModel.additionalInfo
    }
    
    func setupTypeAd() {
        if dataModel.adType == .lost {
            typeAdText.text = "Потерян"
            typeAd.tintColor = .red
            let image = UIImage(named: "lost_image")
            typeAd.image = image
        } else if dataModel.adType == .found {
            typeAdText.text = "Найден"
            typeAd.tintColor = .green
            let image = UIImage(named: "lost_image")
            typeAd.image = image!.withTintColor(.green, renderingMode: .alwaysOriginal)
        } else {
            typeAdText.text = "Ищет дом"
            typeAd.tintColor = .green
            let image = UIImage(named: "lost_image")
            typeAd.image = image!.withTintColor( UIColor(hex: 0xFF9C40, alpha: 1), renderingMode: .alwaysOriginal)
        }
    }
    
    @objc
    func allScreenButtonTapped() {
            let geoVC = GeolocationViewController()
            geoVC.settingsUI(coord: (dataModel.lastSeenLocation.0, dataModel.lastSeenLocation.1))
            geoVC.modalPresentationStyle = .fullScreen
            self.present(geoVC, animated: true)
    }
    
    @objc
    func respondTapped() {
        let view = ResponseViewController()
        view.modalPresentationStyle = .fullScreen
        self.present(view, animated: true)
    }
}

//extension AdViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//         if scrollView.contentOffset.x != 0 {
//             scrollView.contentOffset.x = 0
//         }
//     }
//}

