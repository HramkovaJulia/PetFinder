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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    //MARK: - adding views
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
        self.view.addSubview(connectButton)
        self.view.addSubview(skipButton)
        
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
}
