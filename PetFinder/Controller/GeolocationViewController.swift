//
//  GeolocationViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 23.12.23.
//

import UIKit

class GeolocationViewController: UIViewController {
    
    var currenPositionView: MapView!
    
    private lazy var topView: UIView = {
        let searchandNotificationView = UIView()
        searchandNotificationView.backgroundColor = UIColor(hex: 0xEFBFA5, alpha: 1)
        return searchandNotificationView
    }()

    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Геолокация"
        mainLabel.font = UIFont.sfProText(ofSize: 24, weight: .semiBold)
        mainLabel.textColor = .white
        return mainLabel
    }()
    
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "closedButton"), for: .normal)
        rightButton.addTarget(self, action: #selector(closedVC), for: .touchUpInside)
        return rightButton
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(hex: 0xFCF4EF)
        super.viewDidLoad()
        
    }

    func settingsUI(coord: (Double, Double)) {
        self.currenPositionView = MapView(frame: CGRect.zero, defaultLatitude: coord.0, defaultLongitude: coord.1)
        setup()
        makeConstraints()
    }
    
    func setup() {
        self.view.addSubview(topView)
        self.topView.addSubview(mainLabel)
        self.topView.addSubview(rightButton)
        self.view.addSubview(currenPositionView)
    }
    
    func makeConstraints() {
        topView.snp.makeConstraints { maker in
            maker.left.right.top.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(63)
            maker.left.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(23)
        }
        
        rightButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(61)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(20)

        }
        
        currenPositionView.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().inset(95)
            
        }
    }

    @objc
    func closedVC() {
        self.dismiss(animated: true)
    }
}
