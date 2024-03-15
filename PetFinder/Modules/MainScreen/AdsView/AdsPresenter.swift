//
//  AdsPresenter.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 15.03.24.
//

import Foundation
import UIKit

class AdsPresenter: AdsInteractorOutput, ObservableObject {
    
    @Published var adsModel: [PostModel] = [
        PostModel(id: "",globalInfoAboutPet: GlobalInfoAboutPet(statusOFPost: .lookingForAHome, kindOfAnimal: .dog), mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [UIImage()]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .she, titleOfPost: "пусто", Date: "пусто"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "пусто")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "хуй", infoPet: "хуй")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Фиолетовая 45"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "пусто"))
    ]
    
    let interactor: AdsInteractor
    
    init(interactor: AdsInteractor){
        self.interactor = interactor
        interactor.output = self
    }
    
    func fetchedPostModel(_ models: [PostModel]) {
        adsModel = models
    }
    
}
