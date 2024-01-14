//
//  SecondCreateViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 12.01.24.
//

import UIKit
import SnapKit

class SecondCreateViewController: UIViewController {
    private let photoCollectionView = PhotoCollectionView()
    private let colorCollectionView = ColorCollectionView()
    private let medecineStatus = MedecineStatusView()
    var heightConstraint: NSLayoutConstraint!
    
    
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        //        topView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12)
        return topView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Дополнительные данные"
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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contenntView = UIView()
        return contenntView
    }()
    
    private lazy var photoLabel: UILabel = {
        let photoLabel = UILabel()
        photoLabel.text = "Фото"
        photoLabel.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        photoLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return photoLabel
    }()
    
    private lazy var colorPetLabel: UILabel = {
        let colorPet = UILabel()
        colorPet.text = "Окрас"
        colorPet.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        colorPet.textColor = UIColor(hex: 0x250404, alpha: 1)
        return colorPet
    }()
    
    private lazy var medecinDataLabel: UILabel = {
        let MedecinDataLabel = UILabel()
        MedecinDataLabel.text = "Медицинские данные"
        MedecinDataLabel.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        MedecinDataLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return MedecinDataLabel
    }()
    
    private lazy var switchData: UISwitch = {
        let switchData = UISwitch()
        switchData.isOn = false
        switchData.addTarget(self, action: #selector(isEnebledView), for: .allEvents)
        return switchData
    }()
    
    private lazy var medecinView: UIView = {
        let medecinView = UIView()
        medecinView.backgroundColor = UIColor(hex: 0xffffff, alpha: 1)
        medecinView.layer.cornerRadius = 12
        return medecinView
    }()
    
    private lazy var specialFeatures: UILabel = {
        let specialFeatures = UILabel()
        specialFeatures.text = "Особые приметы"
        specialFeatures.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        specialFeatures.textColor = UIColor(hex: 0x250404, alpha: 1)
        return specialFeatures
    }()
    
    private lazy var specialFeaturesField: UITextView = {
        let specialFeaturesField = UITextView()
        specialFeaturesField.isEditable = true
        specialFeaturesField.layer.cornerRadius = 20
        return specialFeaturesField
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Далее", for: .normal)
        nextButton.layer.cornerRadius = 25
        nextButton.backgroundColor = UIColor(hex: 0xFF975F, alpha: 1)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return nextButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        medecineStatus.alpha = 0.4
        medecineStatus.isUserInteractionEnabled = false
        heightConstraint = specialFeaturesField.heightAnchor.constraint(equalToConstant: 200)
        heightConstraint.priority = UILayoutPriority(rawValue: 999)
        heightConstraint.isActive = true
        
        specialFeaturesField.delegate = self
        setupUI()
        makeConstaints()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        self.view.addSubview(topView)
        topView.addSubview(mainLabel)
        topView.addSubview(leftButton)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(photoLabel)
        self.contentView.addSubview(photoCollectionView)
        self.contentView.addSubview(colorPetLabel)
        self.contentView.addSubview(colorCollectionView)
        self.contentView.addSubview(medecinDataLabel)
        self.contentView.addSubview(switchData)
        self.contentView.addSubview(medecineStatus)
        self.contentView.addSubview(specialFeatures)
        self.contentView.addSubview(specialFeaturesField)
        self.view.addSubview(nextButton)
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
        
        scrollView.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-5)
            maker.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.width.equalTo(scrollView)
//            maker.height.equalTo(self.view)
        }
        
        photoLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(24)
            maker.left.equalToSuperview().inset(16)
        }
        
        photoCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(photoLabel.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(0)
            maker.right.equalToSuperview().inset(0)
            maker.height.equalTo(104)
        }
        
        colorPetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(photoCollectionView.snp.bottom).inset(-41)
            maker.left.equalToSuperview().inset(16)
        }
        
        colorCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(colorPetLabel.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(168)
        }
        
        medecinDataLabel.snp.makeConstraints { maker in
            maker.top.equalTo(colorCollectionView.snp.bottom).inset(-40)
            maker.left.equalToSuperview().inset(16)
        }
        
        switchData.snp.makeConstraints { maker in
            maker.top.equalTo(colorCollectionView.snp.bottom).inset(-40)
            maker.right.equalToSuperview().inset(15)
        }
        
        medecineStatus.snp.makeConstraints { maker in
            maker.top.equalTo(medecinDataLabel.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(141)
        }
        
        specialFeatures.snp.makeConstraints { maker in
            maker.top.equalTo(medecineStatus.snp.bottom).inset(-40)
            maker.left.equalToSuperview().inset(16)
        }
        
        specialFeaturesField.snp.makeConstraints { maker in
            maker.top.equalTo(specialFeatures.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(100)
        }
        
        nextButton.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(53)
        }
    }
    
    @objc
    func closeViewController() {
        self.dismiss(animated: true)
    }
    
    @objc func isEnebledView(sender: UISwitch) {
        if sender.isOn {
            medecineStatus.alpha = 1
            medecineStatus.isUserInteractionEnabled = true
        } else {
            medecineStatus.alpha = 0.4
            medecineStatus.isUserInteractionEnabled = false
            medecineStatus.clearAllRadioButton()
        }
    }
    
    @objc func nextVC() {
        let viewcontroller = LocationPetViewController()
        viewcontroller.modalPresentationStyle = .fullScreen
        self.present(viewcontroller, animated: true)
    }
}

extension SecondCreateViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        // Установка минимальной высоты
        let minHeight: CGFloat = 100
        let calculatedHeight = max(minHeight, estimatedSize.height)
        heightConstraint.constant = calculatedHeight
    }
}


