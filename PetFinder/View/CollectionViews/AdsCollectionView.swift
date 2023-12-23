//
//  AdsTableView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 21.10.23.
//

import UIKit

class AdsCollectionView: UICollectionView {
    
    private var massivePet: [LostPetCard] = [
        LostPetCard(petName: "Джек", petType: .dog, adType: .lost, createPost: "Сегодня, 12:33", breed: "Хаски", color: "Серый", age: 2, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (123) 456-7890", additionalInfo: "Носит синий ошейник."),
        LostPetCard(petName: "Мурка", petType: .cat, adType: .found, createPost: "Вчера, 10:13", breed: "Британская", color: "Черный", age: 5, gender: .female, lastSeenLocation: (59.9343, 30.3351), contactNumber: "+7 (987) 654-3210", additionalInfo: "В один обычный день, когда солнце ярко светило на улицах, произошло несчастье - собака по имени Бэйли исчезла. Это была веселая и игривая собака, которая всегда привносила радость и счастье в жизнь своих хозяев. Но сейчас все было иначе.Хозяева, Джон и Мэри, были в отчаянии. Они обошли все уголки своего района, обратились в местные приюты и объявили о пропаже в социальных сетях. Но нигде не было никаких следов Бэйли. Они были уверены, что собака была похищена, и их сердца были полны горя"),
        LostPetCard(petName: "Рики", petType: .dog, adType: .searched, createPost: "Сегодня, 00:12", breed: "Такса", color: "Рыжий", age: 3, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (555) 123-4567", additionalInfo: "Очень дружелюбный."),
        LostPetCard(petName: "Кеша", petType: .bird, adType: .lost, createPost: "04.11.2023, 12:12", breed: "Ара", color: "Многоцветный", age: 10, gender: .male, lastSeenLocation: (53.9045, 27.5615), contactNumber: "+375 (29) 123-4567", additionalInfo: "Говорит на нескольких языках."),
        LostPetCard(petName: "Барсик", petType: .cat, adType: .found, createPost: "Вчера, 12:23, 00:12", breed: "Мейн-кун", color: "Серый", age: 1, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (111) 222-3333", additionalInfo: "Игривый и ласковый.")
    ]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        super.init(frame: .zero, collectionViewLayout: layout)
        commonInit()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    
    private func commonInit() {
        setup()
        self.register(AdsCollectionViewCell.self, forCellWithReuseIdentifier: "AdsCollectionViewCell")
    }
    
    func setup() {
        self.dataSource = self
        self.delegate = self
//        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
}

extension AdsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return massivePet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: AdsCollectionViewCell
        if let reuseCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as? AdsCollectionViewCell {
                 cell = reuseCell
             } else {
                 cell = AdsCollectionViewCell()
             }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: AdsCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        cell.createUI(data: [massivePet[indexPath.row]])
        return cell
    }
}

extension AdsCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            let adViewController = AdViewController(viewModel: massivePet[indexPath.row])
            adViewController.modalPresentationStyle = .fullScreen
            viewController.present(adViewController, animated: true)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let itemWidth = collectionViewWidth * 0.44
        let itemHeight = itemWidth * 1.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            if section == 0 {
                return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            } else {
                return UIEdgeInsets.zero
            }
        }




}



