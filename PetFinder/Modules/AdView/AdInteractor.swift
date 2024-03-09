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
        let adDetails = PostModel(mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [UIImage()]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(imageOfSex: UIImage(), titleOfPost: "1212", Date: "121212"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: false, sterilized: false), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "sadasdasdasd")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "adsasdasd", infoPet: "asdasdasd")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(missingAddress: "щыоващыотаыва", possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "fsidhfisjhdf"))
        
        output?.dataFetched(adDetails)
    }
    
}







