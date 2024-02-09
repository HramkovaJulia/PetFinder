//
//  MedecineStatusView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 13.01.24.
//

import UIKit
import SnapKit

class MedecineStatusView: UIView {
    
    private lazy var vaccinatedLabel: UILabel = {
        let specialFeatures = UILabel()
        specialFeatures.text = "Привит"
        specialFeatures.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        specialFeatures.textColor = UIColor(hex: 0x250404, alpha: 1)
        return specialFeatures
    }()
    
    private lazy var sterilizedLabel: UILabel = {
        let specialFeatures = UILabel()
        specialFeatures.text = "Стерилизован"
        specialFeatures.font = UIFont.sfProText(ofSize: 16, weight: .regular)
        specialFeatures.textColor = UIColor(hex: 0x250404, alpha: 1)
        return specialFeatures
    }()
    
    private lazy var vaccinatedTrueButton: UIButton = {
        let vaccinatedTrueButton = UIButton()
        vaccinatedTrueButton.tag = 0
        vaccinatedTrueButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        vaccinatedTrueButton.setTitle("Да", for: .normal)
        vaccinatedTrueButton.setTitleColor(.label, for: .normal)
        vaccinatedTrueButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        vaccinatedTrueButton.addTarget(self, action: #selector(radioButtontapped), for: .allEvents)
        return vaccinatedTrueButton
    }()
       
    private lazy var sterilizedTrueButton: UIButton = {
        let sterilizedTrueButton = UIButton()
        sterilizedTrueButton.tag = 2
        sterilizedTrueButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        sterilizedTrueButton.setTitle("Да", for: .normal)
        sterilizedTrueButton.setTitleColor(.label, for: .normal)
        sterilizedTrueButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        sterilizedTrueButton.addTarget(self, action: #selector(radioButtontapped), for: .allEvents)
        return sterilizedTrueButton
    }()
    
    private lazy var vaccinatedFalseButton: UIButton = {
        let vaccinatedFalseButton = UIButton()
        vaccinatedFalseButton.tag = 1
        vaccinatedFalseButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        vaccinatedFalseButton.setTitle("Нет", for: .normal)
        vaccinatedFalseButton.setTitleColor(.label, for: .normal)
        vaccinatedFalseButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        vaccinatedFalseButton.addTarget(self, action: #selector(radioButtontapped), for: .allEvents)

        return vaccinatedFalseButton
    }()
       
    private lazy var sterilizedrFalseButton: UIButton = {
        let sterilizedrFalseButton = UIButton()
        sterilizedrFalseButton.tag = 3
        sterilizedrFalseButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        sterilizedrFalseButton.setTitle("Нет", for: .normal)
        sterilizedrFalseButton.setTitleColor(.label, for: .normal)
        sterilizedrFalseButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        sterilizedrFalseButton.addTarget(self, action: #selector(radioButtontapped), for: .allEvents)

        return sterilizedrFalseButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstaints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
        makeConstaints()
    }

    func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.addSubview(vaccinatedLabel)
        self.addSubview(sterilizedLabel)
        self.addSubview(vaccinatedTrueButton)
        self.addSubview(sterilizedTrueButton)
        self.addSubview(vaccinatedFalseButton)
        self.addSubview(sterilizedrFalseButton)
    }
    
    func makeConstaints() {
        vaccinatedLabel.snp.makeConstraints { maker in
            maker.top.left.equalToSuperview().inset(18)
        }
        
        sterilizedLabel.snp.makeConstraints { maker in
            maker.top.right.equalToSuperview().inset(18)
        }
        
        vaccinatedTrueButton.snp.makeConstraints { maker in
            maker.top.equalTo(vaccinatedLabel.snp.bottom).inset(-12)
            maker.left.equalTo(vaccinatedLabel.snp.left)
        }
        
        vaccinatedFalseButton.snp.makeConstraints { maker in
            maker.top.equalTo(vaccinatedTrueButton.snp.bottom).inset(-14)
            maker.left.equalTo(vaccinatedLabel.snp.left)
        }
        
        sterilizedTrueButton.snp.makeConstraints { maker in
            maker.top.equalTo(sterilizedLabel.snp.bottom).inset(-12)
            maker.left.equalTo(sterilizedLabel.snp.left)
        }
        
        sterilizedrFalseButton.snp.makeConstraints { maker in
            maker.top.equalTo(sterilizedTrueButton.snp.bottom).inset(-14)
            maker.left.equalTo(sterilizedLabel.snp.left)
        }
        
    }
    
    @objc func radioButtontapped(sender: UIButton) {
        if sender.tag == 0 {
            sender.setImage(UIImage(named: "activeButton"), for: .normal)
            vaccinatedFalseButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        } else if sender.tag == 1 {
            sender.setImage(UIImage(named: "activeButton"), for: .normal)
            vaccinatedTrueButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        } else if sender.tag == 2 {
            sender.setImage(UIImage(named: "activeButton"), for: .normal)
            sterilizedrFalseButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        } else if sender.tag == 3 {
            sender.setImage(UIImage(named: "activeButton"), for: .normal)
            sterilizedTrueButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        }
    }
    
    func clearAllRadioButton() {
        vaccinatedFalseButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        vaccinatedTrueButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        sterilizedrFalseButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
        sterilizedTrueButton.setImage(UIImage(named: "unactiveButton"), for: .normal)
    }
    
}
