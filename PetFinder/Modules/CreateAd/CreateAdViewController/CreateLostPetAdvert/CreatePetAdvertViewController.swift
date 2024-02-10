//
//  CreatePetAdvertViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 16.12.23.
//

import UIKit
import SnapKit
import SwiftUI

class CreatePetAdvertViewController: UIViewController {
    
    private let animalsCollectionView = UIHostingController(rootView: ContentView(showSortView: {
        
    }, massiveCell: [["dog","Собаки"], ["cat","Кошки"], ["bird","Птицы"], ["mouse","Грызуны"], ["others","Прочее"]]))
    private let segmentControll = CustomizableSegmentControl(items: ["Мальчик", "Девочка"])
    
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
//        topView.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 12)
        return topView
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Данные о питомце"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        return mainLabel
    }()
    
    private lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setImage(PFAssets.backspaceButton.image, for: .normal)
        leftButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        leftButton.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return leftButton
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contenntView = UIView()
        return contenntView
    }()
    
    private lazy var typePetLabel: UILabel = {
        let typePetLabel = UILabel()
        typePetLabel.text = "Вид питомца"
        typePetLabel.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        typePetLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return typePetLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let typePetLabel = UILabel()
        typePetLabel.text = "Описание"
        typePetLabel.font = UIFont.sfProText(ofSize: 20, weight: .medium)
        typePetLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return typePetLabel
    }()
    
    private lazy var namePetLabel: UILabel = {
        let namePetLabel = UILabel()
        namePetLabel.text = "Кличка*"
        namePetLabel.font = UIFont.sfProText(ofSize: 16, weight: .medium)
        namePetLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return namePetLabel
    }()
    
    private lazy var namePetTextField: UITextField = {
        let namePetTextField = UITextField()
        namePetTextField.layer.cornerRadius = 25
        namePetTextField.layer.cornerCurve = .continuous
        namePetTextField.backgroundColor = UIColor(hex: 0xfcfcfc, alpha: 1)
        namePetTextField.placeholder = "Барсик"
        namePetTextField.layer.shadowColor = UIColor(hex: 0x5a5a5a, alpha: 0.06).cgColor
        namePetTextField.layer.shadowOpacity = 1
        namePetTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
        namePetTextField.layer.shadowRadius = 4

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: namePetTextField.frame.size.height))
        namePetTextField.leftView = paddingView
        namePetTextField.leftViewMode = .always
        
        return namePetTextField
    }()
    
    private lazy var oldPetLabel: UILabel = {
        let oldPetLabel = UILabel()
        oldPetLabel.text = "Возраст"
        oldPetLabel.font = UIFont.sfProText(ofSize: 16, weight: .medium)
        oldPetLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return oldPetLabel
    }()
    
    private lazy var oldPetTextField: UITextField = {
        let oldPetTextField = UITextField()
        oldPetTextField.layer.cornerRadius = 25
        oldPetTextField.layer.cornerCurve = .continuous
        oldPetTextField.backgroundColor = UIColor(hex: 0xfcfcfc, alpha: 1)
        oldPetTextField.placeholder = "1,5 года"
        oldPetTextField.layer.shadowColor = UIColor(hex: 0x5a5a5a, alpha: 0.06).cgColor
        oldPetTextField.layer.shadowOpacity = 1
        oldPetTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
        oldPetTextField.layer.shadowRadius = 4

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: namePetTextField.frame.size.height))
        oldPetTextField.leftView = paddingView
        oldPetTextField.leftViewMode = .always
        
        return oldPetTextField
    }()
    
    private lazy var sexPetLabel: UILabel = {
        let oldPetLabel = UILabel()
        oldPetLabel.text = "Пол"
        oldPetLabel.font = UIFont.sfProText(ofSize: 16, weight: .medium)
        oldPetLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return oldPetLabel
    }()
    
    private lazy var sexPetSegmentControl: UISegmentedControl = {
        let sexPetSegmentControl = UISegmentedControl(items: ["Мальчик", "Девочка"])
        sexPetSegmentControl.clipsToBounds = true
        sexPetSegmentControl.layer.masksToBounds = true
        
        return sexPetSegmentControl
    }()
    
    private lazy var viewPetLabel: UILabel = {
        let oldPetLabel = UILabel()
        oldPetLabel.text = "Вид*"
        oldPetLabel.font = UIFont.sfProText(ofSize: 16, weight: .medium)
        oldPetLabel.textColor = UIColor(hex: 0x250404, alpha: 1)
        return oldPetLabel
    }()
    
    private lazy var dropdownButton: DropdownButton = {
        let dropdownButton = DropdownButton(frame: CGRect(x: 0, y: 0, width: 344, height: 53))
        dropdownButton.backgroundColor = UIColor(hex: 0xfcfcfc)
        dropdownButton.layer.cornerRadius = 25
        dropdownButton.layer.borderWidth = 1
        dropdownButton.layer.borderColor = UIColor(hex: 0x83CBFF).cgColor
        
        dropdownButton.setTitle("Выберите вид животного", for: .normal)
        dropdownButton.setTitleColor(.label, for: .normal)
        dropdownButton.contentHorizontalAlignment = .left
        dropdownButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        dropdownButton.gameList = ["Выберите вид животного", "Овчарка", "Какой-то терьер", "Дворняга", "Моя булочка", "Мое солнышко"]
        
        return dropdownButton
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Далее", for: .normal)
        nextButton.layer.cornerRadius = 25
        nextButton.backgroundColor = UIColor(hex: 0xFF975F, alpha: 1)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        return nextButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    func setup() {
        setupUI()
        makeConstaints()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF, alpha: 1)
        self.view.addSubview(topView)
        self.topView.addSubview(leftButton)
        self.topView.addSubview(mainLabel)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(typePetLabel)
        self.contentView.addSubview(animalsCollectionView.view)
        animalsCollectionView.view.backgroundColor = .clear
        
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(namePetLabel)
        self.contentView.addSubview(namePetTextField)
        self.contentView.addSubview(oldPetLabel)
        self.contentView.addSubview(oldPetTextField)
        self.contentView.addSubview(sexPetLabel)
        self.contentView.addSubview(segmentControll)
        self.contentView.addSubview(viewPetLabel)
        self.contentView.addSubview(dropdownButton)
        self.view.addSubview(nextButton)
    }

    func makeConstaints() {
        topView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalTo(leftButton.snp.right).inset(-14)
            maker.bottom.equalToSuperview().inset(22)
        }
        
        scrollView.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom).inset(-5)
            maker.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
            maker.width.equalTo(scrollView)
            maker.height.equalTo(view)
        }
        
        typePetLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(20)
            maker.left.equalToSuperview().inset(16)
        }
        
        animalsCollectionView.view.snp.makeConstraints { maker in
            maker.top.equalTo(typePetLabel.snp.bottom).inset(-16)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(94)
        }
        
        descriptionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(animalsCollectionView.view.snp.bottom).inset(-40)
            maker.left.equalTo(16)
            
        }
        
        namePetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(descriptionLabel.snp.bottom).inset(-16)
            maker.left.equalToSuperview().inset(24)
        }
        
        namePetTextField.snp.makeConstraints { maker in
            maker.top.equalTo(namePetLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)

        }
        
        oldPetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(namePetTextField.snp.bottom).inset(-14)
            maker.left.equalToSuperview().inset(24)
        }
        
        oldPetTextField.snp.makeConstraints { maker in
            maker.top.equalTo(oldPetLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        sexPetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(oldPetTextField.snp.bottom).inset(-14)
            maker.left.equalToSuperview().inset(24)
        }
        
        segmentControll.snp.makeConstraints { maker in
            maker.top.equalTo(sexPetLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        viewPetLabel.snp.makeConstraints { maker in
            maker.top.equalTo(segmentControll.snp.bottom).inset(-14)
            maker.left.equalToSuperview().inset(24)
        }
        
        dropdownButton.snp.makeConstraints { maker in
            maker.top.equalTo(viewPetLabel.snp.bottom).inset(-10)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.height.equalTo(53)
        }
        
        nextButton.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(34)
            maker.height.equalTo(53)
        }
        
    }

    @objc
    func nextVC() {
        let viewController = SecondCreateViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func closeViewController() {
        self.dismiss(animated: true)
    }
}
