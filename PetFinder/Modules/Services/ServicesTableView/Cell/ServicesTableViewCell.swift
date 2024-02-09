//
//  ServicesTableViewCell.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 7.11.23.
//

import UIKit
import SnapKit



class ServicesTableViewCell: UITableViewCell {

    private let listServicesCollectionView = ListServicesCollectionView()

    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = UIColor(hex: 0xD9D9D9, alpha: 1)
        mainView.roundCorners(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: 12)

        return mainView
    }()
    
    private lazy var insertView: UIView = {
        let insertView = UIView()
        insertView.backgroundColor = .clear
        return insertView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 18, weight: .medium)
        mainLabel.textColor = UIColor(hex: 0x000000, alpha: 1)
        mainLabel.lineBreakMode = .byTruncatingTail
        mainLabel.numberOfLines = 0
        return mainLabel
    }()
    
    private lazy var showAllDescription: UIButton = {
        let showAllDescriptionText = UIButton()
        showAllDescriptionText.setTitle("Показать все", for: .normal)
        showAllDescriptionText.titleLabel?.font = UIFont.sfProText(ofSize: 14, weight: .light)
        showAllDescriptionText.backgroundColor = .clear
        showAllDescriptionText.setTitleColor(UIColor(hex: 0x000000, alpha: 1), for: .normal)
        return showAllDescriptionText
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setupData(nameLabel: String) {
        mainLabel.text = nameLabel
        setupUI()
        makeConstaints()
    }
    
    
    func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.addSubview(mainView)
        self.addSubview(insertView)
        self.mainView.addSubview(mainLabel)
        self.mainView.addSubview(showAllDescription)
        self.contentView.addSubview(listServicesCollectionView)
    }
    
    func makeConstaints() {
        insertView.snp.makeConstraints { maker in
            maker.left.right.bottom.equalToSuperview()
            maker.height.equalTo(24)
        }
        
        mainView.snp.makeConstraints { maker in
            maker.left.right.top.equalToSuperview()
            maker.bottom.equalTo(insertView.snp.top).inset(-1)
            maker.height.equalTo(203)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(14)
            maker.left.equalToSuperview().inset(16)
            maker.height.equalTo(21)
        }
        
        showAllDescription.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(17.5)
            maker.right.equalToSuperview().inset(16)
            maker.height.equalTo(14)
        }
        
        listServicesCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel.snp.bottom).offset(12)
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview()
            maker.bottom.equalTo(mainView.snp.bottom).offset(-18)
        }
    }
    
    
    @objc private func handleCollectionViewTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: listServicesCollectionView)
        
        if let indexPath = listServicesCollectionView.indexPathForItem(at: location) {
            listServicesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
