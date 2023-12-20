//
//  HomeController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import UIKit
import SnapKit



class HomeViewController: UIViewController {
    
    private let connectButton = CustomButton(title: "Присоединиться", hasBackground: true)
    private let skipButton = CustomButton(title: "Пропустить")
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        
        //alerts
        //        AlertManager.showInvalidEmailAlert(on: self)
    }
    
    //MARK: - adding views
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.view.addSubview(connectButton)
        self.view.addSubview(skipButton)
        
        self.connectButton.addTarget(self, action: #selector(didTapConnect), for: .touchUpInside)
        self.skipButton.addTarget(self, action: #selector(didTapSkip), for: .touchUpInside)

        
        //MARK: - constrains
        connectButton.snp.makeConstraints { make in
            
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalTo(skipButton.snp.top).offset(-10)
            
        }
        skipButton.snp.makeConstraints { make in
            
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(0)
        }
    }
    //MARK: - selectors
    @objc private func didTapConnect() {
        print("DEBUG PRINT:", "didTapSignIn")
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapSkip() {
        print("DEBUG PRINT: didTapSkip")
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
