//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI
import MapKit

struct AdView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    MainInfoAboutPetAdView()
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.top, 12)
                        .padding(.horizontal, 15)
                    AdditionalInfoAboutPetAdView()
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                    MapInfoInfoAboutPetAdView()
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(12)
                        .padding(.horizontal, 15)
                    SpecialnoteInfoAboutPetAdView()
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
    var body: some View {
        VStack(spacing: 12) {
            Text("Особые приметы")
                .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 14)
            Text("Красный ошейник с золотой косточкой. На косточке написана кличка. Есть белое пятно на спине.")
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
            
        }
    }
}

#Preview {
    AdView()
}
