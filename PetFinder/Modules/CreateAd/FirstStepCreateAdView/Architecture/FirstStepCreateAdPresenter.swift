//
//  FirstStepCreateAdPresenter.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 24.03.24.
//

import Foundation
import SwiftUI

class FirstStepCreateAdPresenter: ObservableObject{
    
        @State var interactor: FirstStepCreateAdInteractor
    
        @Published var selectedPet: KindOfAnimal
        @Published var statusOfPost: StatusOfPost
        @Published var descriptionsFirstStepCreateAdModel: DescriptionsFirstStepCreateAdModel
        
        init(interactor: FirstStepCreateAdInteractor) {
            self.interactor = interactor
            self.selectedPet = .none // Set initial value as needed
            self.statusOfPost = .zero // Set initial value as needed
            self.descriptionsFirstStepCreateAdModel = DescriptionsFirstStepCreateAdModel(name: "", age: "", sex: .it) // Set initial value as needed
        }
   }

