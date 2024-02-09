//
//  NotificationTableViewCell.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 25.12.23.
//

import UIKit
import SnapKit

class NotificationTableViewCell: UITableViewCell {

    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = UIColor(hex: 0xfcfcfc, alpha: 1)
        mainView.layer.cornerRadius = 16
        return mainView
    }()
    
    private lazy var insertView: UIView = {
        let insertView = UIView()
        insertView.backgroundColor = .clear
        return insertView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 16, weight: .medium)
        mainLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        mainLabel.numberOfLines = 0
        return mainLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 12, weight: .regular)
        mainLabel.textColor = UIColor(hex: 0x000000, alpha: 1)
        mainLabel.numberOfLines = 2
        return mainLabel
    }()
    
    private lazy var dateCreationLabel: UILabel = {
        let dateCreationLabel = UILabel()
        dateCreationLabel.font = UIFont.sfProText(ofSize: 12, weight: .regular)
        dateCreationLabel.textColor = UIColor(hex: 0x8D8D8D, alpha: 1)
        return dateCreationLabel
    }()
    
    private lazy var showMoreButton: UIButton = {
        let showMoreButton = UIButton()
        showMoreButton.setTitle("Подробнее", for: .normal)
        showMoreButton.setTitleColor(UIColor(hex: 0xFF975F, alpha: 1), for: .normal)
        showMoreButton.titleLabel?.font = UIFont.sfProText(ofSize: 12, weight: .regular)
        return showMoreButton
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(data: NotificationModel) {
        self.backgroundColor = .clear
        mainLabel.text = data.notificationLabel
        descriptionLabel.text = data.notificationMessage
        dateCreationLabel.text = data.notificationDate
        
        self.addSubview(insertView)
        self.addSubview(mainView)
        self.mainView.addSubview(mainLabel)
        self.mainView.addSubview(descriptionLabel)
        self.mainView.addSubview(dateCreationLabel)
        self.mainView.addSubview(showMoreButton)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        insertView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview()
            maker.height.equalTo(20)
        }
        
        mainView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.right.equalToSuperview().inset(20)
            maker.bottom.equalTo(insertView.snp.top).inset(1)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(14)
            maker.left.right.equalToSuperview().inset(18)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).inset(-6)
            maker.left.right.equalToSuperview().inset(18)
        }
        
        dateCreationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(18)
            maker.bottom.equalToSuperview().inset(14)
        }
        
        showMoreButton.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).inset(-10)
            maker.right.equalToSuperview().inset(18)
            maker.bottom.equalToSuperview().inset(14)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}
