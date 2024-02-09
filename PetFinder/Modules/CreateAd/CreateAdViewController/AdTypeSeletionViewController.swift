//
//  AdTypeSeletionViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 10.12.23.
//

import UIKit
import SnapKit

class AdTypeSeletionViewController: UIViewController {
    
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
//        topView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12)
        return topView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Новое объявление"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        return mainLabel
    }()
    
    private lazy var leftButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "secondBackButton"), for: .normal)
        rightButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        rightButton.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return rightButton
    }()
    
    private lazy var lostPetButton: UIButton = {
        let lostPetButton = UIButton()
        lostPetButton.setImage(UIImage(named: "lostPetButton"), for: .normal)
        lostPetButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return lostPetButton
    }()
    
    private lazy var foundPetButton: UIButton = {
        let foundPetButton = UIButton()
        foundPetButton.setImage(UIImage(named: "foundPetButton"), for: .normal)
        foundPetButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return foundPetButton
    }()
    
    private lazy var fosterPetButton: UIButton = {
        let fosterPetButton = UIButton()
        fosterPetButton.setImage(UIImage(named: "fosterButton"), for: .normal)
        fosterPetButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return fosterPetButton
    }()
    
    private lazy var getPetButton: UIButton = {
        let getPetButton = UIButton()
        getPetButton.setImage(UIImage(named: "getPetButton"), for: .normal)
        getPetButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return getPetButton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        setupUI()
        makeConstraints()
    }
    
    func setupUI() {
        self.view.addSubview(topView)
        topView.addSubview(mainLabel)
        topView.addSubview(leftButton)
        self.view.addSubview(lostPetButton)
        self.view.addSubview(foundPetButton)
        self.view.addSubview(fosterPetButton)
        self.view.addSubview(getPetButton)
    }

    func makeConstraints() {
        topView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        lostPetButton.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-36)
            maker.left.equalToSuperview().inset(16)
        }
        
        foundPetButton.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-36)
            maker.right.equalToSuperview().inset(16)
        }
        
        fosterPetButton.snp.makeConstraints { maker in
            maker.top.equalTo(foundPetButton.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(16)
        }

        getPetButton.snp.makeConstraints { maker in
            maker.top.equalTo(foundPetButton.snp.bottom).inset(-16)
            maker.right.equalToSuperview().inset(16)
        }
        
    }
    
    @objc
    func closeViewController() {
        self.dismiss(animated: true)
    }
    
    @objc
    func nextVC() {
        let adViewController = CreatePetAdvertViewController()
        adViewController.modalPresentationStyle = .fullScreen
        self.present(adViewController, animated: true)
        
    }
}
