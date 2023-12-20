//
//  HeaderText.swift
//  PetFinder
//
//  Created by Dinar Shakirov on 20.12.2023.
//

import Foundation
import UIKit
import SnapKit

class HeaderTextLabel: UIView {
        
    //MARK: - UI Components
   private let headerLabel: UILabel = {
        let label = UILabel()
       label.textColor = .label
       label.textAlignment = .left
       label.numberOfLines = 1
       label.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
       label.text = "error"
       return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        headerLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - constrains
    private func setupUI() {
        self.addSubview(headerLabel)

//        headerLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview().inset(16)
//            make.right.equalToSuperview().inset(15)
//            make.top.equalToSuperview().inset(14)
//        }
       
    }
}
