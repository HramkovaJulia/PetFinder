//
//  MainViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.10.23.
//

import UIKit
import SwiftUI

final class MainViewController: UIViewController, UISearchBarDelegate {
    private var customSearchTextField: CustomSearchTextField!
    private var swipeGestureRecognizer: UISwipeGestureRecognizer?
    private let userDefaults = UserDefaults.standard
    private let cityKey = "city"
    lazy var animalsCollectionView: UIHostingController<ContentView> = {
        let contentView = ContentView(showSortView: {
            self.showSortView()
        }, massiveCell: [["sortImage", "Сортировка"], ["dog","Собаки"], ["cat","Кошки"], ["bird","Птицы"], ["mouse","Грызуны"], ["others","Прочее"]])
        return UIHostingController(rootView: contentView)
    }()
    private let adsCollectionView = AdsCollectionView()
    
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
        rightMainButton.addTarget(self, action: #selector(showNotificationVC), for: .touchUpInside)
        return rightMainButton
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Доска объявлений"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    
    func createUI() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF)
        setup()
        createSearchandNotificationView()
        setupRightMainButton()
        createAnimalsCollectionView()
        setupAdsTableView()
    }
    
    func createSearchandNotificationView() {
        self.view.addSubview(searchandNotificationView)
        
        searchandNotificationView.snp.makeConstraints { maker in
            maker.left.right.top.equalToSuperview()
            maker.height.equalTo(self.view.safeAreaLayoutGuide).multipliedBy(0.25)
        }
        
        setupMainLabel()
        createSearchBar()
    }
    
    func setupMainLabel() {
        searchandNotificationView.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { maker in
            maker.left.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            maker.top.equalTo(self.view.safeAreaLayoutGuide).inset(5)
        }
    }
    
    func setupRightMainButton() {
        self.view.addSubview(notificationButton)
        
        notificationButton.snp.makeConstraints { maker in
            maker.right.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            maker.top.equalTo(self.view.safeAreaLayoutGuide).inset(5)
            maker.width.equalTo(28)
            maker.height.equalTo(notificationButton.snp.width)
        }
        
        notificationButton.layoutIfNeeded()
        
        notificationButton.layer.cornerRadius = notificationButton.frame.height / 2
    }
    
    func setup() {
        self.view.backgroundColor = UIColor(hex: 0xF9F6F3)
        self.hideKeyboardWhenTappedAround()
        self.view.addSubview(adsCollectionView)
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
    
    func createAnimalsCollectionView() {
        self.view.addSubview(animalsCollectionView.view)
        animalsCollectionView.view.backgroundColor = .clear
        
        animalsCollectionView.view.snp.makeConstraints {maker in
            maker.top.equalTo(searchandNotificationView.snp.bottom).inset(-24)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(78)
        }
    }
    
    func setupAdsTableView() {
        adsCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(animalsCollectionView.view.snp.bottom).inset(-20)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(5)
        }
    }
    
    @objc
    func showNotificationVC() {
        let notification = NotificationsViewController()
        notification.modalPresentationStyle = .fullScreen
        self.present(notification, animated: true)
    }
    
    func showSortView() {
        let hostingVC = UIHostingController(rootView: SortView(dismiss: {
            self.dismiss(animated: true)
        }))
        hostingVC.view.backgroundColor = .clear
        hostingVC.modalPresentationStyle = .formSheet
        if let presentationController = hostingVC.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        self.present(hostingVC, animated: true)
    }

}

extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customSearchTextField.createDeleteRightView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            print("Наша строка: \(customSearchTextField.getString())")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        customSearchTextField.createRightView()
    }
}
