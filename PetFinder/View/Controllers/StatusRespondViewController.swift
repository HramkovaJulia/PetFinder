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
        
        self.view.backgroundColor = UIColor(hex: 0x4A4A4A, alpha: 0.8)
        view.addSubview(rightButton)
        view.addSubview(statusView)
        self.view.addSubview(respond)
    }


    
    func makeConstraints() {
        rightButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.right.equalToSuperview().inset(15)
        }
        
        statusView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(30)
            maker.height.equalTo(128)
            maker.centerX.centerY.equalToSuperview()
        }
        
        respond.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(68)
        }
    }

    @objc
    func closedVC() {
        self.dismiss(animated: true)
    }
}
