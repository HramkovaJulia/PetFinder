//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI
import WrappingHStack

struct AdsView: View {
    @State var dataManager: DataManager
    @ObservedObject var presenter: AdsPresenter
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
        let adsInteractor = AdsInteractor(dataAds: dataManager)
        let adsPresenter = AdsPresenter(interactor: adsInteractor)
        self.presenter = adsPresenter
    }

    @State private var isPresented: Bool = false
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            WrappingHStack(0..<presenter.adsModel.count, id: \.self) { index in
                AdCellView( model: $presenter.adsModel[index])
                    .padding(.bottom, 16)
                    .onTapGesture{
                        isPresented = true
                    }
                    .fullScreenCover(isPresented: $isPresented, content: {
                        AdView(interactor: AdInteractor(dataAd: dataManager), id: presenter.adsModel[index].id)
                    })
                Spacer()
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
