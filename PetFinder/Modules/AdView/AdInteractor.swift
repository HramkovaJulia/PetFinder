//
//  AdInteractor.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 29.02.24.
//

import Foundation
import UIKit

protocol AdInteractorInput {
    //    func fetchData()
    func returnPostModel(with id: String)
}

protocol AdInteractorOutput: AnyObject {
    //    func dataFetched(_ models: [PostModel])
    func postModelWithID(_ model: PostModel)
}

class AdInteractor: AdInteractorInput, ObservableObject {
    
    var dataAd: DataAdProtocol
    weak var output: AdInteractorOutput?
    
    init(dataAd: DataAdProtocol){
        self.dataAd = dataAd
    }
    
    func returnPostModel(with id: String) {
        let adModels = dataAd.fetchAd()
        
        for index in 0 ..< adModels.count{
            if adModels[index].id == id {
                output?.postModelWithID(adModels[index])
            }
        }
    }
    
    //    func fetchData() {
    //        let adModels = dataAd.fetchAd()
    //        output?.dataFetched(adModels)
    //    }
    
    // в этом интаракторе не нада, живет как пример
    func adToData(with newAd: PostModel){
        dataAd.addNewAd(with: newAd)
    }
}
