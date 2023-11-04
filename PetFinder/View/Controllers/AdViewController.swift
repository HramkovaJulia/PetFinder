//
//  AdViewController.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 4.11.23.
//

import UIKit
import SnapKit

class AdViewController: UIViewController {
    
    private let imageCollectionView = ImagesAdCollectionView()
    var pageControl = UIPageControl()
    
    private lazy var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backButton"), for: .normal)
        leftButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        leftButton.addTarget(self, action: #selector(closeAdViewController), for: .touchUpInside)
        return leftButton
    }()
    
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "favoriteButton"), for: .normal)
        rightButton.tintColor = UIColor(hex: 0xFCFCFC, alpha: 1)
        rightButton.addTarget(self, action: #selector(favoriteAdTapped), for: .touchUpInside)
        return rightButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        setupUI()
    }
    
    func setupUI() {
        setupImageView()
        setupBackButton()
        setupFavoriteButton()
        setupPageControll()
    }
    
    //MARK: ButtonControll
    
    private func setupBackButton() {
        self.view.addSubview(leftButton)
        
        leftButton.snp.makeConstraints { maker in
            maker.left.top.equalTo(imageCollectionView).inset(12)
            maker.height.width.equalTo(34)
        }
    }
    
    private func setupFavoriteButton() {
        self.view.addSubview(rightButton)
        
        rightButton.snp.makeConstraints { maker in
            maker.right.top.equalTo(imageCollectionView).inset(12)
            maker.height.width.equalTo(34)
        }
    }

    @objc func closeAdViewController() {
        self.dismiss(animated: true)
    }
    
    @objc func favoriteAdTapped(sender: UIButton) {
        if let image = sender.imageView?.image, image == UIImage(named: "favoriteButton") {
            let tintedImage = image.withTintColor(UIColor(hex: 0xFF9900, alpha: 1), renderingMode: .alwaysOriginal)
            sender.setImage(tintedImage, for: .normal)
        } else {
            sender.setImage(UIImage(named: "favoriteButton"), for: .normal)
        }
    }
    
    //MARK: ImageView
    
    private func setupImageView()  {
        self.view.addSubview(imageCollectionView)
        
        imageCollectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide)
            maker.left.right.equalToSuperview().inset(14)
            maker.height.equalTo(293)
        }
    }
    
    private func setupPageControll() {
        imageCollectionView.didSelectItem = { number in
            self.pageControl.numberOfPages = number
        }
        
        imageCollectionView.didSelectItemWithPage = { [weak self] currentPage in
                  DispatchQueue.main.async {
                      self?.pageControl.currentPage = currentPage
                  }
              }
        
        pageControl.currentPageIndicatorTintColor = UIColor(hex: 0x11C7DB, alpha: 1)
        self.view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints { maker in
            maker.centerX.equalTo(imageCollectionView)
            maker.bottom.equalTo(imageCollectionView.snp.bottom).inset(12)
        }
    }

}


