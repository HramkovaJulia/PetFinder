//
//  LocationPetViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 13.01.24.
//

import UIKit
import SnapKit

class LocationPetViewController: UIViewController {
    
    let dropDownTextField = DropdownTextField()
    var heightConstraint: NSLayoutConstraint!

    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        //        topView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12)
        return topView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Геолокация и описание"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        return mainLabel
    }()
    
    private lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
        leftButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        leftButton.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return leftButton
    }()
    
    private lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.text = "Геолокация*"
        locationLabel.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        locationLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return locationLabel
    }()
    
    private lazy var currentLocationLabel: UILabel = {
        let currentLocationLabel = UILabel()
        currentLocationLabel.text = "Текущее местонахождение"
        currentLocationLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        currentLocationLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return currentLocationLabel
    }()
    
    private lazy var getCurrentLocationSwitch: UISwitch = {
        let getCurrentLocationSwitch = UISwitch()
        getCurrentLocationSwitch.isOn = false
        getCurrentLocationSwitch.addTarget(self, action: #selector(isEnebledView), for: .allEvents)
        return getCurrentLocationSwitch
    }()
    
    private lazy var currentCountryLabel: UILabel = {
        let currentCountryLabel = UILabel()
        currentCountryLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        currentCountryLabel.textColor = UIColor(hex: 0x17397B)
        currentCountryLabel.attributedText = NSAttributedString(string: "Россия", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return currentCountryLabel
    }()
    
    private lazy var markerImage: UIImageView = {
        let markerImage = UIImageView(image: UIImage(named: "mapPoint"))
        return markerImage
    }()
    
    private lazy var mapLabel: UILabel = {
        let distanceLabel = UILabel()
        distanceLabel.font = UIFont.sfProText(ofSize: 14, weight: .regular)
        distanceLabel.attributedText = NSAttributedString(string: "Указать на карте", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        distanceLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        distanceLabel.addGestureRecognizer(tapGesture)

        return distanceLabel
    }()

    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Текст объявления"
        descriptionLabel.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        descriptionLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return descriptionLabel
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.isEditable = true
        descriptionTextView.layer.cornerRadius = 20
        return descriptionTextView
    }()
    
    private lazy var createAds: UIButton = {
        let createAds = UIButton()
        createAds.setTitle("Создать объявление", for: .normal)
        createAds.layer.cornerRadius = 25
        createAds.backgroundColor = UIColor(hex: 0xFF975F, alpha: 1)
        createAds.addTarget(self, action: #selector(createAdsTapped), for: .touchUpInside)
        return createAds
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        heightConstraint = descriptionTextView.heightAnchor.constraint(equalToConstant: 53)
        heightConstraint.priority = UILayoutPriority(rawValue: 999)
        heightConstraint.isActive = true
        
        descriptionTextView.delegate = self
        
        setupUI()
        makeConstaints()
        dropDownTextField.itemList = ["Great Wall of China", "Christ the Redeemer", "Machu Picchu", "Chichen Itza", "Colosseum", "Taj Mahal", "Petra"]

    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        self.view.addSubview(topView)
        topView.addSubview(mainLabel)
        topView.addSubview(leftButton)
        self.view.addSubview(locationLabel)
        self.view.addSubview(currentLocationLabel)
        self.view.addSubview(getCurrentLocationSwitch)
        self.view.addSubview(currentCountryLabel)
        self.view.addSubview(dropDownTextField)
        self.view.addSubview(markerImage)
        self.view.addSubview(mapLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(descriptionTextView)
        self.view.addSubview(createAds)
    }
    
    func makeConstaints() {
        topView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalTo(leftButton.snp.right).inset(-14)
            maker.bottom.equalToSuperview().inset(22)
        }
        
        locationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-24)
            maker.left.equalToSuperview().inset(16)
        }
        
        currentLocationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(locationLabel.snp.bottom).inset(-22.5)
            maker.left.equalToSuperview().inset(16)
        }
        
        getCurrentLocationSwitch.snp.makeConstraints { maker in
            maker.top.equalTo(locationLabel.snp.bottom).inset(-18)
            maker.right.equalToSuperview().inset(15)
        }
        
        currentCountryLabel.snp.makeConstraints { maker in
            maker.top.equalTo(currentLocationLabel.snp.bottom).inset(-12)
            maker.left.equalToSuperview().inset(16)
        }
        
        dropDownTextField.snp.makeConstraints { maker in
            maker.top.equalTo(currentCountryLabel.snp.bottom).inset(-12)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        markerImage.snp.makeConstraints { maker in
            maker.top.equalTo(dropDownTextField.snp.bottom).inset(-12)
            maker.left.equalToSuperview().inset(16)
        }
        
        mapLabel.snp.makeConstraints { maker in
            maker.top.equalTo(dropDownTextField.snp.bottom).inset(-12)
            maker.left.equalTo(markerImage.snp.right).inset(-6)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(mapLabel.snp.bottom).inset(-41.5)
            maker.left.equalToSuperview().inset(16)
        }
        
        descriptionTextView.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
        }
        
    }
    
    @objc
    func closeViewController() {
        self.dismiss(animated: true)
    }
    
    @objc
    func isEnebledView() {
        
    }
    
    @objc
    func createAdsTapped() {
        
    }
    
    @objc
    func labelTapped() {
        let viewcontroller = GeolocationViewController()
        viewcontroller.settingsUI(coord: (59.9390, 30.3158))
        viewcontroller.modalPresentationStyle = .fullScreen
        self.present(viewcontroller, animated: true)
    }
    
}

extension LocationPetViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        // Установка минимальной высоты
        let minHeight: CGFloat = 53
        let calculatedHeight = max(minHeight, estimatedSize.height)
        heightConstraint.constant = calculatedHeight
    }
}
