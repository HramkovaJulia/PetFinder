//
//  RecoveryMessageCodeViewController.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 22.12.2023.
//

import UIKit
import SnapKit


final class RecoveryMessageCodeViewController: UIViewController {
    
    //MARK: - UI Components
    lazy var leftBackButton: UIButton = {
        let leftBackButton = UIButton()
        leftBackButton.setImage(UIImage(named: "backspaceButton"), for: .normal)
        return leftBackButton
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .label
        mainLabel.text = "Восстановление пароля"
        return mainLabel
    }()
    
    private let recievedCodeLabel = HeaderTextLabel(title: "Полученный код")
    private let recievedCodeField = CustomTextField(fieldType: .smsverification)
    
    private let sendCodeAgain = CustomRecoveryButton(style: .sendCodeAgain)
    private let continiue = CustomButton(title: "Далее", hasBackground: true)
    
    //add timer
    private var timer: Timer?
    private var remainingTime: Int = 9
    
    private lazy var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.font = .sfProText(ofSize: 18, weight: .regular)
        timerLabel.textColor = .label
        timerLabel.textAlignment = .center
        return timerLabel
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.continiue.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
        self.leftBackButton.addTarget(self, action: #selector(didTapGoBack), for: .touchUpInside)

        setupUI()
        setupTimer()

    }
    //MARK: - Setup UI
    
    private func setupTimer() {
        timerLabel.text = "0:\(remainingTime)"
        view.addSubview(timerLabel)
        
        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(recievedCodeField.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.9895065427, green: 0.9597766995, blue: 0.9387372732, alpha: 1)
            
        self.view.addSubview(leftBackButton)
        self.view.addSubview(mainLabel)
        self.view.addSubview(recievedCodeLabel)
        self.view.addSubview(recievedCodeField)
        self.view.addSubview(sendCodeAgain)
        self.view.addSubview(continiue)
        
        //MARK: - constrains
        leftBackButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(63)
            make.height.width.equalTo(32)
            }
        mainLabel.snp.makeConstraints { make in
            make.left.equalTo(leftBackButton.snp.right).offset(12)
            make.top.equalToSuperview().inset(68)
            }
            
        recievedCodeLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(72)
        }
        
        recievedCodeField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(53)
            make.top.equalTo(recievedCodeLabel.snp.bottom).offset(24)
        }
        sendCodeAgain.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(recievedCodeField.snp.bottom).offset(77)
        }
        continiue.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-29)
        }
    }
  
    //MARK: - selectors
    @objc private func didTapContinue() {
        print("DEBUG :", "didTapContinue")
        let vc = RecoveryNewPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didTapGoBack() {
        print("DEBUG :", "back button pressed")
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func updateTimer() {
    
        if remainingTime > 0 {
            remainingTime -= 1
            timerLabel.text = "0:\(remainingTime)"
        } else {
            timer?.invalidate()
            timerLabel.removeFromSuperview()
        }
    }
}
