//
//  FirstStepCreateAdInteractor.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 24.03.24.
//

import Foundation

protocol FirstStepCreateAdInteractorInput {
    func createPost(model: PostModel)
}


class FirstStepCreateAdInteractor: ObservableObject , FirstStepCreateAdInteractorInput {

     var dataAd : DataAdProtocol
    
    init(dataAd: DataAdProtocol){
        self.dataAd = dataAd
    }
    
    func createPost(model: PostModel) {
        dataAd.addNewAd(with: model)
    }
    
}
