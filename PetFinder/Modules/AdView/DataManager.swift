//
//  DataManager.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 11.03.24.
//

import Foundation

protocol DataReaderProtocol {
    func fetchAd() -> PostModel
}

protocol DataAdProtocol: DataReaderProtocol {
    func addNewAd(with newDetails: PostModel)
}

class DataManager: DataAdProtocol {
    private var postModel: PostModel?

    func fetchAd() -> PostModel {
        let adDetails = PostModel(mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [PFAssets.dogBack.image]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .he, titleOfPost: "Петрович", Date: "сегодня в 14:30"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "Выгуливал и он убежал в сторону сучки , не смог догнать")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "главный лэйбл", infoPet: "info pet")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Фиолетовая 45"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "Рыжее пятно на боку и висячее правое ухо"))
        return adDetails
    }

    func addNewAd(with newDetails: PostModel) {
        // тута будет стучать в firebase для создания новой записи
        postModel = newDetails
    }
}
