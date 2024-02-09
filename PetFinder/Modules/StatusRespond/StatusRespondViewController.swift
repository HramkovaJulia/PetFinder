//
//  StatusRespondViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.12.23.
//

import UIKit

class StatusRespondViewController: UIViewController {
    
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "closedButton"), for: .normal)
        rightButton.addTarget(self, action: #selector(closedVC), for: .touchUpInside)
        return rightButton
    }()
    
    private lazy var statusView: UIView = {
       let statusView = UIView()
        statusView.backgroundColor = UIColor(hex: 0xfcfcfc)
        statusView.layer.cornerRadius = 12
        return statusView
    }()
    
    private lazy var respondLabel: UILabel = {
        let respondLabel = UILabel()
        respondLabel.text = "Отклик отправлен"
        respondLabel.textAlignment = .center
        respondLabel.textColor = UIColor(hex: 0xFF975F)
        respondLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        return respondLabel
    }()
    
    private lazy var respondDescriptionLabel: UILabel = {
        let respondDescriptionLabel = UILabel()
        respondDescriptionLabel.text = "Вы можете посмотреть все ваши отклики в профиле пользователя."
        respondDescriptionLabel.numberOfLines = 0
        respondDescriptionLabel.textAlignment = .center
        respondDescriptionLabel.textColor = .black
        respondDescriptionLabel.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        return respondDescriptionLabel
    }()
    
    private lazy var respond: UIButton = {
        let respond = UIButton()
        respond.setTitle("Перейти в профиль", for: .normal)
        respond.titleLabel?.font = UIFont.sfProText(ofSize: 18, weight: .semiBold)
        respond.layer.cornerRadius = 35
        respond.backgroundColor = UIColor(hex: 0xFF975F, alpha: 1)
        respond.setTitleColor(UIColor(hex: 0xfcfcfc, alpha: 1), for: .normal)
        return respond
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeConstraints()
    }
    
    func setup() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        
        // Устанавливаем ограничения для размытого представления с использованием SnapKit
        self.view.addSubview(blurView)
        self.view.addSubview(rightButton)
        self.view.addSubview(statusView)
        self.view.addSubview(respond)
        
        self.statusView.addSubview(respondLabel)
        self.statusView.addSubview(respondDescriptionLabel)
        
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func makeConstraints() {
        rightButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.right.equalToSuperview().inset(15)
        }
        
        statusView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(30)
            maker.centerX.centerY.equalToSuperview()
        }
        
        respond.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(68)
        }
        
        respondLabel.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview().inset(24)
        }
        
        respondDescriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(respondLabel.snp.bottom).inset(-14)
            maker.left.right.bottom.equalToSuperview().inset(24)
        }
    }
    

    @objc
    func closedVC() {
        self.dismiss(animated: true)
    }
}
