//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI

struct AdsView: View {
    @State var dataManager: DataManager
    @ObservedObject var presenter: AdsPresenter
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
        let adsInteractor = AdsInteractor(dataAds: dataManager)
        let adsPresenter = AdsPresenter(interactor: adsInteractor)
        self.presenter = adsPresenter
        
    }
    
    @State private var isPresented: Bool = false
    var body: some View {
        
        NavigationStack{
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns,spacing: 0){
                
                ForEach($presenter.adsModel,id: \.self ){ adModel in
                    
                            NavigationLink(destination: AdView(interactor: AdInteractor(dataAd: dataManager), id: adModel.id)){
                                
                                AdCellView(model:adModel)
                                    .padding(.bottom,16)
                            }
//                            print("c таким id инит AdView \(adModel.id)")
                     
                }
            }
        }.onAppear{
            presenter.interactor.fetchPostModels()
        }
        }
    }
}

struct AdsView_Previews: PreviewProvider {
    static var previews: some View {
        let dataManager = DataManager()
        let adsInteractor = AdsInteractor(dataAds: dataManager)
        let adsPresenter = AdsPresenter(interactor: adsInteractor)
        
        return AdsView( dataManager: dataManager)
            .environmentObject(adsPresenter)
    }
}
