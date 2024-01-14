//
//  ColorCollectionView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 12.01.24.
//

import UIKit

class ColorCollectionView: UICollectionView {
    
    private let animalCoatColors = ["Черный", "Белый", "Серый", "Рыжий", "Коричневый", "Пятнистый", "Тигровый", "Апельсиновый", "Светло-серый", "Кремовый", "Черно-белый", "Мраморный", "Голубой", "Золотистый", "+"]

    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        commonInit()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setup()
        self.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: "ColorCollectionViewCell")
    }
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.isScrollEnabled = true
    }
}

extension ColorCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalCoatColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionViewCell", for: indexPath) as? ColorCollectionViewCell else {
            fatalError("Unable to dequeue AnimalCollectionViewCell")
        }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: ColorCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        cell.createUI(text: animalCoatColors[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorCollectionViewCell {
            cell.backgroundColor =  UIColor(hex: 0x83CBFF)
            cell.selectedCell()
        }

    }
    
}

extension ColorCollectionView: UICollectionViewDelegate {

}

extension ColorCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        let attributedString = NSAttributedString(string: animalCoatColors[indexPath.row], attributes: [.font: font])
        let size = attributedString.size()
        
        let width = ceil(size.width)
        let height = ceil(size.height)
        
        if animalCoatColors[indexPath.row] == "+" {
            return CGSize(width: 33, height: 33)
        }
        
        return CGSize(width: width * 1.5, height: height * 1.92)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 1
     }
    

    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        if section == 0 {
    //            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 15)
    //        } else {
    //            return UIEdgeInsets.zero
    //        }
    //    }
    
}
