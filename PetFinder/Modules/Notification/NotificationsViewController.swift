//
//  NotificationsViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 25.12.23.
//

import UIKit
import SnapKit

class NotificationsViewController: UIViewController {
    private var notificationTableView: NotificationTableView!
    
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        return topView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Уведомления"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    private lazy var leftButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
        rightButton.addTarget(self, action: #selector(closedVC), for: .touchUpInside)
        return rightButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        self.view.addSubview(topView)
        self.topView.addSubview(leftButton)
        self.topView.addSubview(mainLabel)
        notificationTableView = NotificationTableView()
        self.view.addSubview(notificationTableView)
    }
    
    private func makeConstraints() {
        topView.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(62)
            maker.left.equalTo(leftButton.snp.right).inset(-14)
            maker.bottom.equalToSuperview().inset(21)
        }
        
        notificationTableView.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-20)
            maker.left.bottom.right.equalToSuperview()
        }
    }

    
    @objc
    func closedVC() {
        self.dismiss(animated: true)
    }

}
