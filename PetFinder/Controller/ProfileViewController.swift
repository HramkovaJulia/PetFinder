//
//  ProfileViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.10.23.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(hex: 0xB7B7B7, alpha: 1)
        topView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12)
        return topView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Профиль"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    private lazy var notificationButton: UIButton = {
        let rightMainButton = UIButton()
        rightMainButton.backgroundColor = .clear
        rightMainButton.tintColor = .black
        rightMainButton.layer.cornerRadius = 0
        rightMainButton.setImage(UIImage(named: "bell"), for: .normal)
        return rightMainButton
    }()
    
    private lazy var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.clipsToBounds = true

        let image = UIImage(named: "dog_back")
        userImageView.image = image
        userImageView.contentMode = .scaleToFill
        userImageView.backgroundColor = .clear

        return userImageView
    }()
    
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Дмитрий"
        userName.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        userName.textColor = UIColor(hex: 0x000000)
        return userName
    }()
    
    private lazy var userDescription: UILabel = {
        let userDescription = UILabel()
        userDescription.text = "Какая-то инфа еще"
        userDescription.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        userDescription.textColor = UIColor(hex: 0x000000)
        return userDescription
    }()
    
    private lazy var edit: UIButton = {
        let edit = UIButton()
        edit.setImage(UIImage(systemName: "pencil"), for: .normal)
        edit.backgroundColor = UIColor(hex: 0xd9d9d9, alpha: 1)
        return edit
    }()
    
    private lazy var userMenu: UIStackView = {
        let userMenu = UIStackView()
        userMenu.axis = .vertical
        userMenu.distribution = .fill
        userMenu.alignment = .leading
        userMenu.spacing = 26
        return userMenu
    }()
    
    private lazy var userAds: UIButton = {
        let userAds = UIButton()
        userAds.setTitleColor(UIColor(hex: 0x000000), for: .normal)
        userAds.setTitle("Мои объявления", for: .normal)
        userAds.titleLabel?.font = UIFont.sfProText(ofSize: 20, weight: .regular)
        return userAds
    }()
    
    private lazy var responses: UIButton = {
        let responses = UIButton()
        responses.setTitleColor(UIColor(hex: 0x000000), for: .normal)
        responses.setTitle("Отклики", for: .normal)
        responses.titleLabel?.font = UIFont.sfProText(ofSize: 20, weight: .regular)
        return responses
    }()
    
    private lazy var settings: UIButton = {
        let settings = UIButton()
        settings.setTitleColor(UIColor(hex: 0x000000), for: .normal)
        settings.setTitle("Настройки профиля", for: .normal)
        settings.titleLabel?.font = UIFont.sfProText(ofSize: 20, weight: .regular)
        return settings
    }()
    
    private lazy var сonfidetionality: UIButton = {
        let сonfidetionality = UIButton()
        сonfidetionality.setTitleColor(UIColor(hex: 0x000000), for: .normal)
        сonfidetionality.setTitle("Настройки конфидециональности", for: .normal)
        сonfidetionality.titleLabel?.font = UIFont.sfProText(ofSize: 20, weight: .regular)
        return сonfidetionality
    }()
    
    private lazy var exit: UIButton = {
        let exit = UIButton()
        exit.setTitleColor(UIColor(hex: 0x000000), for: .normal)
        exit.setTitle("Выход", for: .normal)
        exit.titleLabel?.font = UIFont.sfProText(ofSize: 20, weight: .regular)
        return exit
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupUI()
        setupUserMenu()
        makeConstraints()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hex: 0xECECEC)
        self.view.addSubview(topView)
        self.topView.addSubview(mainLabel)
        self.topView.addSubview(userImageView)
        self.topView.addSubview(notificationButton)
        self.topView.addSubview(userName)
        self.topView.addSubview(userDescription)
        self.topView.addSubview(edit)
        self.view.addSubview(userMenu)
    }
    
    func setupUserMenu() {
        userMenu.addArrangedSubview(userAds)
        userMenu.addArrangedSubview(responses)
        userMenu.addArrangedSubview(settings)
        userMenu.addArrangedSubview(сonfidetionality)
        userMenu.addArrangedSubview(exit)
    }
    
    func makeConstraints() {
        topView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(240)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.left.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            maker.top.equalTo(self.view.safeAreaLayoutGuide).inset(5)
        }
        
        notificationButton.snp.makeConstraints { maker in
            maker.right.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            maker.top.equalTo(self.view.safeAreaLayoutGuide).inset(5)
            maker.width.equalTo(28)
            maker.height.equalTo(notificationButton.snp.width)
        }
        
        userImageView.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).inset(-18)
            maker.left.equalToSuperview().inset(16)
            maker.height.width.equalTo(80)
        }
        
        userImageView.layoutIfNeeded()
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        
        userName.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).inset(-21)
            maker.left.equalTo(userImageView.snp.right).inset(-20)
        }
        
        userDescription.snp.makeConstraints { maker in
            maker.top.equalTo(userName.snp.bottom).inset(-14)
            maker.left.equalTo(userImageView.snp.right).inset(-20)
        }
        
        edit.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).inset(-18)
            maker.right.equalToSuperview().inset(15)
            maker.width.height.equalTo(41)
        }
        
        edit.layoutIfNeeded()
        edit.layer.cornerRadius = edit.frame.width / 2
        
        userMenu.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-24)
            maker.left.equalToSuperview().inset(18)
        }
        
    }
}
