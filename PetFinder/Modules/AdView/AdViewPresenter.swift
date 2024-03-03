//
//  AdViewPresenter.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 29.02.24.
//

import Foundation

protocol AdViewPresenterProtocol: AdViewBusinessLogic,AdViewDataStoreProtocol {
    func viewDidLoad()
}

class AdViewPresenter: ObservableObject {
    
    weak var dysplayLogic: AdViewDisplayLogic?
    var model: PostModel
    
    init(model: PostModel){
        self.model = model
    }
    
    func onViewDidLoad() {
        dysplayLogic?.displayPostModel(model)
    }

    
}
