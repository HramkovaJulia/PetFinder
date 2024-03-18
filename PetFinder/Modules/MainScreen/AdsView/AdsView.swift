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
        GridItem(.flexible(),spacing: 16),
        GridItem(.flexible())
    ]
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
        let adsInteractor = AdsInteractor(dataAds: dataManager)
        let adsPresenter = AdsPresenter(interactor: adsInteractor)
        self.presenter = adsPresenter
    }
    
    var body: some View {

            LazyVGrid(columns: columns,spacing: 0){
                
                ForEach($presenter.adsModel,id: \.self ){ adModel in
                    NavigationStack{
                        NavigationLink(destination: AdView(interactor: AdInteractor(dataAd: dataManager), id: adModel.id)){
                            
                            // цифра больше - ячейка меньше
                            let width =  (UIScreen.main.bounds.width  / CGFloat(columns.count)) - 24
                            let height =  width * 1.45
                            
                            AdCellView(model:adModel)
                                .frame(width: width,height: height)
                                .padding(.bottom,16)
                        }.foregroundColor(.black)
                    }
                }
            }.onAppear{
                presenter.interactor.fetchPostModels()
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
