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
    func fetchPostModel(with id: String)
}

protocol AdInteractorOutput: AnyObject {
    //    func dataFetched(_ models: [PostModel])
    func fetchedPostModel(_ model: PostModel)
}

class AdInteractor: AdInteractorInput, ObservableObject {
   

    var dataAd: DataAdProtocol
    weak var output: AdInteractorOutput?
    
    init(dataAd: DataAdProtocol){
        self.dataAd = dataAd
    }
    
    func fetchPostModel(with id: String) {
        let adModels = dataAd.fetchAd()
        
        for index in 0 ..< adModels.count{
            if adModels[index].id == id {
                print("по такому айди идет поиск модели \(id)")
                output?.fetchedPostModel(adModels[index])
                break
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
