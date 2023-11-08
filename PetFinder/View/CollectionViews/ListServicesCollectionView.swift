//
//  ListServicesCollectionView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 7.11.23.
//

import UIKit
import SnapKit


class ListServicesCollectionView: UICollectionView {
    
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
            layout.itemSize = CGSize(width: 146, height: bounds.height) // Размер элемента
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setup()
        self.register(ListServicesCollectionViewCell.self, forCellWithReuseIdentifier: "ListServicesCollectionViewCell")
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

extension ListServicesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListServicesCollectionViewCell", for: indexPath) as? ListServicesCollectionViewCell else {
            fatalError("Unable to dequeue AnimalCollectionViewCell")
        }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: ListServicesCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        cell.createUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ListServicesCollectionView: UICollectionViewDelegate {
    override func select(_ sender: Any?) {
        print(1)
    }
}
