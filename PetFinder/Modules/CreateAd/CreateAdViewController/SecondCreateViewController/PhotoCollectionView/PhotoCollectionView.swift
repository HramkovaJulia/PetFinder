//
//  PhotoCollectionView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 12.01.24.
//

import UIKit

class PhotoCollectionView: UICollectionView {
    
    init() {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.minimumInteritemSpacing = 16
           super.init(frame: .zero, collectionViewLayout: layout)
           commonInit()
       }
       
    override func layoutSubviews() {
        super.layoutSubviews()
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 146, height: bounds.height ) // Размер элемента
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setup()
        self.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    }
    
    func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        self.dataSource = self
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.isScrollEnabled = true
    }
}

extension PhotoCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("Unable to dequeue AnimalCollectionViewCell")
        }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: PhotoCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        cell.createUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension PhotoCollectionView: UICollectionViewDelegate {
    override func select(_ sender: Any?) {
        print(1)
    }
}

extension PhotoCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 15)
        } else {
            return UIEdgeInsets.zero
        }
    }
}
