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

struct NameSexMainInfoAboutPetAdModel {
    var imageOfSex: UIImage
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
}
    


struct MapInfoInfoAboutPetAdModel {
    var possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel
    var stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel
}

struct PossitionButtonsMapInfoInfoAboutPetAdModel {
    
}
struct StackMapViewInfoInfoAboutPetAdModel {
    
}

struct SpecialnoteInfoAboutPetAdModel {
    
}
