//
//  CuctomNavBarViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 25.12.2023.
//

import UIKit
import SnapKit

 class CustomNavigationView: UIView {
    
    //MARK: - UI Components
    private lazy var topView: UIView = {
        let customTopBarView = UIView()
        customTopBarView.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        return customTopBarView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    private lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
        leftButton.addTarget(self, action: #selector(goToPreviousVC), for: .touchUpInside)
        return leftButton
    }()
    
    //замыкание для обработки переходов
    var backButtonAction: (() -> Void)?
    
    init(title: String) {
        super.init(frame: .zero)
        setupUI()
        mainLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Selectors
    @objc private func goToPreviousVC() {
        print("DEBUG :", "goToPreviousVC")
        backButtonAction?()
    }
    
    //MARK: - constrains
    private func setupUI() {
        
        self.addSubview(topView)
        self.topView.addSubview(mainLabel)
        self.topView.addSubview(leftButton)
       
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(63)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(23)
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(20)
        }
       
    }
    
}
