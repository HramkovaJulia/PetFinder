//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI
import MapKit

protocol AdViewDisplayLogic: AnyObject {
    func displayPostModel(_ model: PostModel)
}

// Протокол для взаимодействия с презентером и контроллером
protocol AdViewBusinessLogic {
    func onViewDidLoad()
    
}

protocol AdViewDataStoreProtocol {
    var model: PostModel { get set }
}

struct AdView: View {
    
    @StateObject var presenter: AdViewPresenter

    @State var model: PostModel?
    
    init(model: PostModel) {
        self._model = State(initialValue: model)
        self._presenter = StateObject(wrappedValue: AdViewPresenter(model: model))
        }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    MainInfoAboutPetAdView(model: model!.mainInfoAboutPetModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.top, 14)
                        .padding(.horizontal, 15)
                    AdditionalInfoAboutPetAdView(model: model!.additionalInfoAboutPetAdModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                    MapInfoInfoAboutPetAdView(model: model!.mapInfoInfoAboutPetAdModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                    SpecialnoteInfoAboutPetAdView(model: model!.specialnoteInfoAboutPetAdModel)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 86)
                    Spacer()
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
    
    @State var model: SpecialnoteInfoAboutPetAdModel
 
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


