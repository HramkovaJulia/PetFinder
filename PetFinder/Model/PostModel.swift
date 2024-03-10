//
//  PostModel.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 26.02.24.
//

import Foundation
import UIKit

struct PostModel {
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
 
struct MapInfoInfoAboutPetAdModel {
    var missingAddress: String
    var possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel
    var stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel
}

struct PossitionButtonsMapInfoInfoAboutPetAdModel {
    
}
struct StackMapViewInfoInfoAboutPetAdModel {
    
}

struct SpecialnoteInfoAboutPetAdModel {
    var specialSigns: String
}
