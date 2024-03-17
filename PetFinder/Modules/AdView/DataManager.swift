//
//  DataManager.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 11.03.24.
//

import Foundation

protocol DataReaderProtocol {
    func fetchAd() -> [PostModel]
}

protocol DataAdProtocol: DataReaderProtocol {
    func addNewAd(with model: PostModel)
}

class DataManager: DataAdProtocol {
    private var postModels: [PostModel] = []
    private var models: [PostModel] = []
    
    init() {
        self.models = [PostModel(id:"1", globalInfoAboutPet: GlobalInfoAboutPet(statusOFPost: .lost, kindOfAnimal: .dog),mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [PFAssets.dogBack.image,PFAssets.dogBack.image]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .he, titleOfPost: "Петрович", Date: "сегодня в 14:30"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "Выгуливал и он убежал в сторону сучки , не смог догнать")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "главный лэйбл", infoPet: "info pet")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Фиолетовая 45"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "Рыжее пятно на боку и висячее правое ухо")),
                       PostModel(id:"2", globalInfoAboutPet: GlobalInfoAboutPet(statusOFPost: .lost, kindOfAnimal: .dog),mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [PFAssets.dogBack.image,PFAssets.dogBack.image]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .he, titleOfPost: "Михалыч", Date: "сегодня в 14:30"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: false, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "Выгуливал и он убежал в сторону сучки , не смог догнать")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "главный лэйбл", infoPet: "info pet")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Фиолетовая 45"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "Рыжее пятно на боку и висячее правое ухо")),
                       PostModel(id:"3", globalInfoAboutPet: GlobalInfoAboutPet(statusOFPost: .lost, kindOfAnimal: .dog),mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [PFAssets.dogBack.image,PFAssets.dogBack.image]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .he, titleOfPost: "Виталя", Date: "Завтра"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: false), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "Хуета ебаная не появляется")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "Хуявный", infoPet: "info pet")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Улица разбитый фонарей"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "мамаы нету"))]
    }
    
    func fetchAd() -> [PostModel] {
        
        postModels = models
        return postModels
    }
    
    func addNewAd(with model: PostModel) {
        // тута будет стучать в firebase для создания новой записи
        postModels.append(model)
    }
}
