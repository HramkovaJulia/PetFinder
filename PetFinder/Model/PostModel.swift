//
//  PostModel.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 26.02.24.
//

import Foundation
import UIKit

struct PostModel: Identifiable, Hashable {
    
    static func == (lhs: PostModel, rhs: PostModel) -> Bool {
            // Сравните свойства, которые участвуют в равенстве
            return lhs.id == rhs.id
            // Возвращайте true, если свойства равны
        }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            // Комбинируйте хеш-коды свойств, которые участвуют в равенстве
        }
   
    var id = UUID().uuidString
    var globalInfoAboutPet: GlobalInfoAboutPet
    var mainInfoAboutPetModel: MainInfoAboutPetAdModel
    var additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel
    var mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel
    var specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel
}

struct MainInfoAboutPetAdModel {
    var imageScrollModel: ImageScrollModel
    var nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel
    var medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel
    var descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel
}

enum StatusOfPost{
    case found
    case lost
    case lookingForAHome
    case zero
}

enum KindOfAnimal{
    case dog
    case cat
    case bird
    case rodent
    case other
    case none
}

struct GlobalInfoAboutPet {
    var statusOFPost: StatusOfPost
    var kindOfAnimal: KindOfAnimal
}

struct ImageScrollModel {
    var images: [UIImage]
}

enum Sex {
    case he
    case she
    case it
}

struct NameSexMainInfoAboutPetAdModel {
    var sex: Sex
    var titleOfPost: String
    var Date: String
}

struct MedecineStatusMainInfoAboutPetAdModel {
    var vaccinated: Bool
    var sterilized: Bool
}

struct DescriptionMainInfoAboutPetAdModel {
    var description: String
}

struct AdditionalInfoAboutPetAdModel {
    var stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel
}

struct StacksInfoAdditionalInfoAboutPetAdModel{
    var stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel]
}

struct StackInfoAdditionalInfoAboutPetAdModel {
    var mainLabel: String
    var infoPet: String
}

enum TypeOfAdress: String {
    case missingAdress = "Адрес пропажи"
    case location = "Местонахождение"
}
 
struct MapInfoInfoAboutPetAdModel {
    var typeOfAdress: TypeOfAdress
    var possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel
    var stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel
}

struct PossitionButtonsMapInfoInfoAboutPetAdModel {
    var adress: String
}
struct StackMapViewInfoInfoAboutPetAdModel {
    
}

struct SpecialnoteInfoAboutPetAdModel {
    var specialSigns: String
}
