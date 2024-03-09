//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI
import MapKit


struct AdView: View {
    
    @ObservedObject var presenter: AdPresenter 
    let interactor: AdInteractor = AdInteractor()
    
    init (){
        self.presenter = AdPresenter(interactor: interactor)
    }
    
    
    var body: some View {
        ZStack {
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
                        .padding(.bottom, 86)
                    Spacer()
                }.onAppear{
                    interactor.fetchData()
                }
            }
            
            .background(Color(PFAssets.background.color))
            VStack {
                ButtonsStackMainInfoAboutPetAdView()
                    .padding(.leading, 28)
                    .padding(.trailing, 27)
                    .padding(.top, 26)
                Spacer()
                CustomOrangeButton(action: {
                    
                }, text: "Откликнуться")
                .padding(.leading, 16)
                .padding(.trailing, 15)
                .padding(.bottom, 0)
            }
        }
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


