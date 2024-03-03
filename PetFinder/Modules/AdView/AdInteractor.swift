//
//  AdInteractor.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 29.02.24.
//

import Foundation
import UIKit

protocol AdInteractorProtocol {
    func fetchData()
    // Добавьте другие методы для обработки бизнес-логики
}

class AdInteractor: AdInteractorProtocol {
    
    var presenter: AdViewPresenterProtocol?
    var dataService: AdViewDataStoreProtocol
    
    init (dataService: AdViewDataStoreProtocol){
        self.dataService = dataService
    }
    
    
    
    
    
    func fetchData() {
        let adDetails = PostModel(mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [UIImage()]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(imageOfSex: UIImage(), titleOfPost: "1212", Date: "121212"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "sadasdasdasd")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "adsasdasd", infoPet: "asdasdasd")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(missingAddress: "щыоващыотаыва", possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "fsidhfisjhdf"))
        
        presenter?.model = adDetails
        
    }
    
    
    
    
}
