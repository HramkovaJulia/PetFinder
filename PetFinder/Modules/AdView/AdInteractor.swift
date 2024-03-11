//
//  AdInteractor.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 29.02.24.
//

import Foundation
import UIKit

protocol AdInteractorInput {
    func fetchData()
}

protocol AdInteractorOutput: AnyObject {
    func dataFetched(_ model: PostModel)
}

class AdInteractor: AdInteractorInput {
    
    weak var output: AdInteractorOutput?
    
    func fetchData() {
        let adDetails = PostModel(mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [PFAssets.dogBack.image]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .he, titleOfPost: "Петрович", Date: "сегодня в 14:30"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "Выгуливал и он убежал в сторону сучки , не смог догнать")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "главный лэйбл", infoPet: "info pet")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Фиолетовая 45"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "Рыжее пятно на боку и висячее правое ухо"))
        
        output?.dataFetched(adDetails)
    }
    
}
