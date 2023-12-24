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
        topView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        return topView
    }()
    
    private lazy var userView: UIView = {
        let userView = UIView()
        userView.layer.cornerRadius = 16
        userView.backgroundColor = UIColor(hex: 0xffffff, alpha: 1)
        return userView
    }()
    
    private lazy var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.clipsToBounds = true

        let image = UIImage(named: "placeholderPhoto")
        userImageView.image = image
        userImageView.contentMode = .scaleToFill
        userImageView.backgroundColor = .clear

        return userImageView
    }()
    
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Ивановский Дмитрий"
        userName.textAlignment = .center
        userName.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        userName.textColor = UIColor(hex: 0x000000)
        return userName
    }()
    
    private lazy var userAdsView: UIView = {
        let userAdsView = UIView()
        userAdsView.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        userAdsView.layer.cornerRadius = 8
        return userAdsView
    }()
    
    private lazy var insertAdsView: UIView = {
        let insertAdsView = UIView()
        insertAdsView.backgroundColor = .white
        return insertAdsView
    }()
    
    private lazy var userAdsLabel: UILabel = {
        let userAdsLabel = UILabel()
        userAdsLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        userAdsLabel.textColor = UIColor(hex: 0xFF975F, alpha: 1)
        userAdsLabel.text = "Мои\nобъявления"
        userAdsLabel.numberOfLines = 0
        userAdsLabel.textAlignment = .center
        return userAdsLabel
    }()
    
    private lazy var userAdsCountLabel: UILabel = {
        let userAdsCountLabel = UILabel()
        userAdsCountLabel.font = UIFont.sfProText(ofSize: 20, weight: .semiBold)
        userAdsCountLabel.textColor = UIColor(hex: 0xFF975F, alpha: 1)
        userAdsCountLabel.text = "0"
        userAdsCountLabel.textAlignment = .center
        return userAdsCountLabel
    }()
    
    private lazy var userRespondView: UIView = {
        let userRespondView = UIView()
        userRespondView.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        userRespondView.layer.cornerRadius = 8
        return userRespondView
    }()
    
    private lazy var insertRespondView: UIView = {
        let insertRespondView = UIView()
        insertRespondView.backgroundColor = .white
        return insertRespondView
    }()
    
    private lazy var userRespondLabel: UILabel = {
        let userRespondLabel = UILabel()
        userRespondLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        userRespondLabel.textColor = UIColor(hex: 0xFF975F, alpha: 1)
        userRespondLabel.text = "Мои\nотклики"
        userRespondLabel.numberOfLines = 0
        userRespondLabel.textAlignment = .center
        return userRespondLabel
    }()
    
    private lazy var userRespondCountLabel: UILabel = {
        let userRespondCountLabel = UILabel()
        userRespondCountLabel.font = UIFont.sfProText(ofSize: 20, weight: .semiBold)
        userRespondCountLabel.textColor = UIColor(hex: 0xFF975F, alpha: 1)
        userRespondCountLabel.text = "0"
        userRespondCountLabel.textAlignment = .center
        return userRespondCountLabel
    }()
    
    private lazy var settingsProfileView: UIView = {
        let settingsProfileView = UIView()
        settingsProfileView.backgroundColor = UIColor(hex: 0xffffff, alpha: 1)
        settingsProfileView.layer.cornerRadius = 8
        return settingsProfileView
    }()
    
    private lazy var notificationButton: UIButton = {
        let notification = UIButton()
        notification.setTitle("Уведомления", for: .normal)
        notification.setTitleColor(.label, for: .normal)
        notification.setImage(UIImage(named: "bellProfile"), for: .normal)
        notification.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        return notification
    }()
    
    private lazy var settingsButton: UIButton = {
        let settingsButton = UIButton()
        settingsButton.setTitle("Настройки", for: .normal)
        settingsButton.setTitleColor(.label, for: .normal)
        settingsButton.setImage(UIImage(named: "settingsProfile"), for: .normal)
        settingsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        return settingsButton
    }()
    
    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("Выход", for: .normal)
        exitButton.setTitleColor(.label, for: .normal)
        exitButton.setImage(UIImage(named: "exitProfile"), for: .normal)
        exitButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        return exitButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupUI()
        makeConstraints()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hex: 0xECECEC)
        self.view.addSubview(topView)
        self.view.addSubview(userView)
        self.view.addSubview(userImageView)
        self.userView.addSubview(userName)
        
        self.userView.addSubview(userAdsView)
        self.userAdsView.addSubview(userAdsLabel)
        self.userAdsView.addSubview(insertAdsView)
        self.userAdsView.addSubview(userAdsCountLabel)
        
        self.userView.addSubview(userRespondView)
        
        self.userRespondView.addSubview(userRespondLabel)
        self.userRespondView.addSubview(insertRespondView)
        self.userRespondView.addSubview(userRespondCountLabel)
        
        self.view.addSubview(settingsProfileView)
        self.settingsProfileView.addSubview(notificationButton)
        self.settingsProfileView.addSubview(settingsButton)
        self.settingsProfileView.addSubview(exitButton)
 
    }

    
    func makeConstraints() {
        topView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
            maker.height.equalTo(240)
        }
        
        userView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(148)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(252)
        }
        
        userImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(73)
            maker.centerX.equalToSuperview()
            maker.height.width.width.equalTo(150)
        }
        
        userImageView.layoutIfNeeded()
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        
        userName.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(82)
            maker.left.right.equalToSuperview()
        }
        
        userAdsView.snp.makeConstraints { maker in
            maker.top.equalTo(userName.snp.bottom).inset(-24)
            maker.left.bottom.equalToSuperview().inset(24)
            maker.width.equalTo(138)
            maker.height.equalTo(100)
        }
        
        userAdsLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.right.equalToSuperview().inset(24)
        }
        
        insertAdsView.snp.makeConstraints {  maker in
            maker.top.equalTo(userAdsLabel.snp.bottom).inset(-3)
            maker.left.right.equalToSuperview().inset(11)
            maker.height.equalTo(1)
        }
        
        userAdsCountLabel.snp.makeConstraints { maker in
            maker.top.equalTo(insertAdsView.snp.bottom).inset(-3)
            maker.bottom.equalToSuperview().inset(10)
            maker.centerX.equalToSuperview()
        }
        
        userRespondView.snp.makeConstraints { maker in
            maker.top.equalTo(userName.snp.bottom).inset(-24)
            maker.right.equalToSuperview().inset(24)
            maker.width.equalTo(138)
            maker.height.equalTo(100)
        }
//        
        userRespondLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.right.equalToSuperview().inset(24)
        }
        
        insertRespondView.snp.makeConstraints {  maker in
            maker.top.equalTo(userRespondLabel.snp.bottom).inset(-3)
            maker.left.right.equalToSuperview().inset(11)
            maker.height.equalTo(1)
        }
        
        userRespondCountLabel.snp.makeConstraints { maker in
            maker.top.equalTo(insertRespondView.snp.bottom).inset(-3)
            maker.bottom.equalToSuperview().inset(10)
            maker.centerX.equalToSuperview()
        }
        
        settingsProfileView.snp.makeConstraints { maker in
            maker.top.equalTo(userView.snp.bottom).inset(-24)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(156)
        }
        
        notificationButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(20)
            maker.left.equalToSuperview().inset(24)
        }
        
        settingsButton.snp.makeConstraints { maker in
            maker.top.equalTo(notificationButton.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(24)
        }
        
        exitButton.snp.makeConstraints { maker in
            maker.top.equalTo(settingsButton.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(24)
        }
        
    }
}
