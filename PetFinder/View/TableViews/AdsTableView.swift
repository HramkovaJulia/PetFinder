//
//  AdsTableView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 21.10.23.
//

import UIKit

class AdsTableView: UITableView {


    private var massivePet: [LostPetCard] = [
        LostPetCard(petName: "Джек", petType: .dog, adType: .lost, createPost: "Сегодня, 12:33", breed: "Хаски", color: "Серый", age: 2, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (123) 456-7890", additionalInfo: "Носит синий ошейник."),
        LostPetCard(petName: "Мурка", petType: .cat, adType: .found, createPost: "Вчера, 10:13", breed: "Британская", color: "Черный", age: 5, gender: .female, lastSeenLocation: (59.9343, 30.3351), contactNumber: "+7 (987) 654-3210", additionalInfo: "Имеет белые лапки."),
        LostPetCard(petName: "Рики", petType: .dog, adType: .searched, createPost: "Сегодня, 00:12", breed: "Такса", color: "Рыжий", age: 3, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (555) 123-4567", additionalInfo: "Очень дружелюбный."),
        LostPetCard(petName: "Кеша", petType: .bird, adType: .lost, createPost: "04.11.2023, 12:12", breed: "Ара", color: "Многоцветный", age: 10, gender: .male, lastSeenLocation: (53.9045, 27.5615), contactNumber: "+375 (29) 123-4567", additionalInfo: "Говорит на нескольких языках."),
        LostPetCard(petName: "Барсик", petType: .cat, adType: .found, createPost: "Вчера, 12:23, 00:12", breed: "Мейн-кун", color: "Серый", age: 1, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (111) 222-3333", additionalInfo: "Игривый и ласковый.")
    ]
    
    init() {
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setup()
        self.register(AdsTableViewCell.self, forCellReuseIdentifier: "AdsTableViewCell")
    }
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
}

extension AdsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return massivePet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: AdsTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell") as? AdsTableViewCell {
                 cell = reuseCell
             } else {
                 cell = AdsTableViewCell()
             }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: AdsTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        cell.createUI(data: [massivePet[indexPath.row]])
        return cell
    }
}

extension AdsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            let adViewController = AdViewController(viewModel: massivePet[indexPath.row])
            adViewController.modalPresentationStyle = .fullScreen
            viewController.present(adViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
}



