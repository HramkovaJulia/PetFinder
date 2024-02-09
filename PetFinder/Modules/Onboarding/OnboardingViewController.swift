//
//  OnboardingViewController.swift
//  PetFinder
//
//  Created by Julia on 07.02.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    private let connectButton: PFButton = {
        let button = PFButton()
        button.setTitle("Присоединиться", for: .normal)
        button.backgroundColor = PFAssets.ginger.color
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapConnect), for: .touchUpInside)
        return button
    }()

    private let skipButton: PFButton = {
        let button = PFButton()
        button.setTitle("Пропустить", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(PFAssets.ginger.color, for: .normal)
        button.addTarget(self, action: #selector(didTapSkipSignIn), for: .touchUpInside)
        button.layer.cornerRadius = 0
        button.layer.borderWidth = 0
        return button
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    //MARK: - adding views
    private func setupUI() {
        self.view.backgroundColor = PFAssets.background.color
        self.view.addSubview(connectButton)
        self.view.addSubview(skipButton)

        connectButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(skipButton.snp.top)
            make.height.equalTo(62)

        }
        skipButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-24)
            make.height.equalTo(62)
        }
    }
    //MARK: - Selectors
    @objc private func didTapConnect() {
        let vc = AuthViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapSkipSignIn() {
        let vc = CustomTabBarControllerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


