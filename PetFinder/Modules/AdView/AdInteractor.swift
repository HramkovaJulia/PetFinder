//
//  AdInteractor.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 29.02.24.
//

import Foundation
import UIKit

protocol AdInteractorInput {
    func fetchData()
}

protocol AdInteractorOutput: AnyObject {
    func dataFetched(_ model: PostModel)
}

class AdInteractor: DataManager, AdInteractorInput, ObservableObject {
    
    var dataAd: DataAdProtocol
    weak var output: AdInteractorOutput?
    
    init(dataAd: DataAdProtocol){
        self.dataAd = dataAd
    }
    
    func fetchData() {
        let adModel = dataAd.fetchAd()
        output?.dataFetched(adModel)
    }
    
    func adToData(with newAd: PostModel){
        dataAd.addNewAd(with: newAd)
    }
    
}
