//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI
import MapKit


struct AdView: View {
    var id: String
    @ObservedObject var presenter: AdPresenter
    
    @Environment(\.presentationMode) var presentationMode
    
    init(interactor: AdInteractor,id: String) {
        let adPresenter = AdPresenter(interactor: interactor)
        self.presenter = adPresenter
        self.id = id
    }
    var body: some View {
        VStack {
            ButtonsStackMainInfoAboutPetAdView(backAction:{
                presentationMode.wrappedValue.dismiss()
            }).padding(.leading, 28)
                .padding(.trailing, 27)
                .padding(.bottom,8)
                .background(Color(PFAssets.beige.color))
            
            ScrollView {
                VStack(spacing: 20) {
                    MainInfoAboutPetAdView(model: $presenter.adModel.mainInfoAboutPetModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.top, 14)
                        .padding(.horizontal, 15)
                    AdditionalInfoAboutPetAdView(model: $presenter.adModel.additionalInfoAboutPetAdModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                    MapInfoInfoAboutPetAdView(model: $presenter.adModel.mapInfoInfoAboutPetAdModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                    SpecialnoteInfoAboutPetAdView(model: $presenter.adModel.specialnoteInfoAboutPetAdModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                        .padding(.bottom,16)
                }.onAppear{
                    presenter.interactor.returnPostModel(with: id)
                }
            }
            
            
            
            CustomOrangeButton(action: {
                
            }, text: "Откликнуться")
            .padding(.leading, 16)
            .padding(.trailing, 15)
        }
        .background(Color(PFAssets.background.color))
    }
}

struct SpecialnoteInfoAboutPetAdView: View {
    
    @Binding var model: SpecialnoteInfoAboutPetAdModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Особые приметы")
                .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 14)
            Text(model.specialSigns)
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
            
        }
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        let dataManager = DataManager()
        let adInteractor = AdInteractor(dataAd: dataManager)
        let adPresenter = AdPresenter(interactor: adInteractor)
        
        return AdView(interactor: adInteractor, id: "123")
            .environmentObject(adPresenter)
    }
}
