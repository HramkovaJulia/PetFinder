//
//  AdsModel.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 21.10.23.
//

import Foundation

enum TypeAd {
    case lost
    case found
    case searched
}

enum TypePet {
    case dog
    case cat
    case bird
    case rodent
    case other
}

enum Gender {
    case male
    case female
}

struct LostPetCard {
    let petName: String
    let petType: TypePet
    let adType: TypeAd
    let createPost: String
    let breed: String
    let color: String
    let age: Int
    let gender: Gender
    let lastSeenLocation: (Double, Double)
    let contactNumber: String
    let additionalInfo: String
    let vaccinated: Bool
    let sterilised: Bool
}
