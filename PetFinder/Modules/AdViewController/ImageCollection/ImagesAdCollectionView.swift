//
//  ImagesAdCollectionView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 4.11.23.
//
import UIKit
import SnapKit

class ImagesAdCollectionView: UICollectionView {
    var didSelectItem: ((Int) -> Void)?
    var didSelectItemWithPage: ((Int) -> Void)?
    
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
        self.register(ImageAdCollectionViewCell.self, forCellWithReuseIdentifier: "ImageAdCollectionViewCell")
        setup()
    }
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        self.layer.cornerRadius = 24
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionViewLayout = layout
    }
}

extension ImagesAdCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        didSelectItem?(3)
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageAdCollectionViewCell", for: indexPath) as? ImageAdCollectionViewCell else {
            fatalError("Unable to dequeue AnimalCollectionViewCell")
        }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: ImageAdCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        cell.setupUI()
        return cell
    }

}

extension ImagesAdCollectionView: UICollectionViewDelegate {

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
              let pageWidth = self.frame.size.width
              let currentPage = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
                didSelectItemWithPage?(currentPage)
          }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard scrollView == self else {
            return
        }
        
        let cellWidth = self.bounds.width / 2
        let visibleCellsCount = Int(self.bounds.width / cellWidth)
        let centerCellIndex = Int(self.contentOffset.x / cellWidth) + visibleCellsCount / 2
        let targetIndex = centerCellIndex - (centerCellIndex % visibleCellsCount)
        targetContentOffset.pointee = CGPoint(x: CGFloat(targetIndex) * cellWidth, y: 0)
    }
}

extension ImagesAdCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

