//
//  AdditionalInfoAboutPetAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct AdditionalInfoAboutPetAdView: View {
    @State var model: AdditionalInfoAboutPetAdModel
    
    var body: some View {
        VStack(spacing: 14) {
            Text("Данные о питомце")
                .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 14)
            StacksInfoAdditionalInfoAboutPetAdView(model: model.stacksInfoAdditionalInfoAboutPetAdModel)
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
        }
    }
}

struct StacksInfoAdditionalInfoAboutPetAdView: View {
   @State var model: StacksInfoAdditionalInfoAboutPetAdModel
    
    var body: some View {
        VStack(spacing: 10) {
            
            ForEach(model.stackInfoAdditionalInfoAboutPetAdModel, id: \.infoPet) { stack in
                StackInfoAdditionalInfoAboutPetAdView(model: stack )
            }
            
            
        }
    }
}

struct StackInfoAdditionalInfoAboutPetAdView: View {
   @State var model: StackInfoAdditionalInfoAboutPetAdModel
    var body: some View {
        HStack {
            Text(model.mainLabel)
                .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 12)))
                .foregroundColor(Color(PFAssets.darkGray.color))
            Spacer()
            Text(model.infoPet)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
        }
    }
}


//#Preview {
//    AdditionalInfoAboutPetAdView()
//}
