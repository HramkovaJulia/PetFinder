//
//  AdViewPresenter.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 29.02.24.
//

import Foundation
import UIKit

class AdPresenter: ObservableObject, AdInteractorOutput {
    
    @Published var adModel: PostModel = PostModel(mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [UIImage()]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .she, titleOfPost: "пусто", Date: "пусто"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "пусто")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "пусто", infoPet: "пусто")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(missingAddress: "пусто", possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "пусто"))
    
    private let interactor: AdInteractor

    init(interactor: AdInteractor) {
        self.interactor = interactor
        interactor.output = self
       }

    func dataFetched(_ model: PostModel) {
        adModel = model
    }
}
