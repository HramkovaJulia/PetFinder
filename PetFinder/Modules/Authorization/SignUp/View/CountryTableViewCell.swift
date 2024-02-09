//
//  CountryTableViewCell.swift
//  PetFinder
//
//  Created by Julia on 06.02.2024.
//
import UIKit
import SnapKit
import DropDown

class CountryTableViewCell: UITableViewCell, UITextFieldDelegate {

    static var identifier = "CountryTableViewCell"

    let dropDown = DropDown()
    var selectedCountry: String?
    var didSelectCountry: (() -> Void)?

    private lazy var countryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Выберите страну", for: .normal)
        button.titleLabel?.font = PFFontFamily.SFProText.light.font(size: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderColor = PFAssets.lightGray.color.cgColor
        button.layer.borderWidth = 1
        button.contentHorizontalAlignment = .leading

        button.titleEdgeInsets = UIEdgeInsets(top: 18, left: 24, bottom: 18, right: 10)
        button.addTarget(self, action: #selector(countryButtonTapped), for: .touchUpInside)
        
        return button
    }()

    private let mainLabel: PFLabel = {
        let label = PFLabel()
        label.text = "Страна"
        return label
    }()

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: PFAssets.list.name) // Иконка стрелки вниз
        imageView.tintColor = .black // Цвет иконки
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDropDown()
        setup()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDropDown() {
        dropDown.anchorView = countryButton
        dropDown.backgroundColor = .white
        dropDown.textColor = .black
        dropDown.textFont = PFFontFamily.SFProText.light.font(size: 14)
        dropDown.dataSource = ["Казахстан", "Россия", "Беларусь"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.countryButton.setTitle(item, for: .normal)
            self.selectedCountry = item
        }
    }

    @objc private func countryButtonTapped() {
        didSelectCountry?()
    }

    func countryCellButtonTapped() {
           dropDown.show()
        countryButton.setTitleColor(.black, for: .normal)
        countryButton.titleLabel?.font = PFFontFamily.SFProText.regular.font(size: 14)
        countryButton.layer.borderColor = PFAssets.darkBlue.color.cgColor
       }

    private func setupUI() {
        contentView.backgroundColor = PFAssets.background.color
        contentView.addSubview(mainLabel)
        contentView.addSubview(countryButton)
        contentView.addSubview(arrowImageView)
    }

    private func setup() {
        setupUI()
        makeConstraints()
    }

    private func makeConstraints() {

        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(6)
            make.height.equalTo(19)
        }

        countryButton.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.height.equalTo(53)
            make.leading.trailing.equalToSuperview()
        }

        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(countryButton)
            make.trailing.equalTo(countryButton.snp.trailing).offset(-16)
            make.height.equalTo(28)
            make.width.equalTo(12)
        }
    }
}

