//
//  AdsInteractor.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 15.03.24.
//

import Foundation

protocol AdSInteractorInput {
    func fetchPostModels()
}

protocol AdsInteractorOutput: AnyObject {
    func fetchedPostModel(_ models: [PostModel])
}

class AdsInteractor: AdSInteractorInput,ObservableObject {
   
    var dataAds: DataAdProtocol
    weak var output: AdsInteractorOutput?
    
    init(dataAds: DataAdProtocol){
        self.dataAds = dataAds
    }
    
    func fetchPostModels() {
       let models = dataAds.fetchAd()
        output?.fetchedPostModel(models)
    }
    
}
