//
//  ButtonTableViewCell.swift
//  PetFinder
//
//  Created by Julia on 07.02.2024.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    static var identifier = "ButtonTableViewCell"

    var didTap: (() -> Void)?

    private let button: PFButton = {
        let button = PFButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = PFAssets.ginger.color
        button.tintColor = .white
        button.addTarget(ButtonTableViewCell.self, action: #selector(didTapSignin), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setup(){
        setupUI()
        makeConstraints()
    }

    private func setupUI() {
        contentView.backgroundColor = PFAssets.background.color
        contentView.addSubview(button)
    }

    private func makeConstraints() {
        button.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.height.equalTo(62)

        }
    }

    @objc private func didTapSignin() {
        didTap?()
    }

}
