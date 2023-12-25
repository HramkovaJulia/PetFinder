//
//  CuctomNavBarViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 25.12.2023.
//

import UIKit
import SnapKit


protocol CustomNavigationViewDelegate: AnyObject {
    func customBackButtonTapped()
}

class CustomNavigationView: UIView {
    
    //MARK: - UI Components
    private lazy var topView: UIView = {
        let customTopBarView = UIView()
        customTopBarView.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        return customTopBarView
    }()
    
    lazy var leftBackButton: UIButton = {
        let leftBackButton = UIButton()
        leftBackButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
        leftBackButton.addTarget(self, action: #selector(goingBack), for: .touchUpInside)
        return leftBackButton
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .label
        return mainLabel
    }()
    
    weak var delegate: CustomNavigationViewDelegate?
    
    init(title: String) {
        super.init(frame: .zero)
        mainLabel.text = title
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - constrains
    private func setupUI() {
        
        self.addSubview(topView)
        self.topView.addSubview(mainLabel)
        self.topView.addSubview(leftBackButton)
        
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        
        leftBackButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.left.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalTo(leftBackButton.snp.right).offset(12)
            maker.bottom.equalToSuperview().inset(23)
        }
    }
    @objc private func goingBack() {
        delegate?.customBackButtonTapped()
       
    }
}
