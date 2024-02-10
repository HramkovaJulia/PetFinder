//
//  ServicesViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 7.11.23.
//

import UIKit

class ServicesViewController: UIViewController, UITextFieldDelegate {
    
    private var customSearchTextField: CustomSearchTextField!
    private var servicesTableView: ServicesTableView!
    
    private lazy var searchandNotificationView: UIView = {
        let searchandNotificationView = UIView()
        searchandNotificationView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        searchandNotificationView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12)
        return searchandNotificationView
    }()
    
    private lazy var notificationButton: UIButton = {
        let rightMainButton = UIButton()
        rightMainButton.backgroundColor = .clear
        rightMainButton.tintColor = .black
        rightMainButton.layer.cornerRadius = 0
        rightMainButton.setImage(PFAssets.bell.image, for: .normal)
        return rightMainButton
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Сервисы"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupMainView()
        setupView()
        setupCinstaints()
        createSearchBar()
    }
    
    func setupView() {
        self.view.addSubview(searchandNotificationView)
        searchandNotificationView.addSubview(mainLabel)
        searchandNotificationView.addSubview(notificationButton)
        servicesTableView = ServicesTableView()
        self.view.addSubview(servicesTableView)
    }
    
    func setupMainView() {
        self.view.backgroundColor = UIColor(hex: 0xF9F6F3)
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupCinstaints() {
        searchandNotificationView.snp.makeConstraints { maker in
            maker.left.right.top.equalToSuperview()
            maker.height.equalTo(self.view.safeAreaLayoutGuide).multipliedBy(0.25)
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
        
        servicesTableView.snp.makeConstraints { maker in
            maker.top.equalTo(searchandNotificationView.snp.bottom).inset(-24)
            maker.left.right.equalToSuperview()
            maker.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func createSearchBar() {
        customSearchTextField = CustomSearchTextField()
        customSearchTextField.delegate = self
        self.view.addSubview(customSearchTextField)
        customSearchTextField.snp.makeConstraints { maker in
                 maker.top.equalTo(mainLabel.snp.bottom).inset(-15)
                 maker.left.right.equalToSuperview().inset(10)
                 maker.height.equalTo(48)
             }
    }
}
