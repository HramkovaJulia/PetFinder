//
//  AdditionalInfoAboutPetAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct AdditionalInfoAboutPetAdView: View {
    var body: some View {
        VStack(spacing: 14) {
            Text("Данные о питомце")
                .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 14)
            StacksInfoAdditionalInfoAboutPetAdView()
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
        }
    }
}

struct StacksInfoAdditionalInfoAboutPetAdView: View {
    var body: some View {
        VStack(spacing: 10) {
            StackInfoAdditionalInfoAboutPetAdView(mainLabel: "Возраст:", infoPet: "1.5 года")
            StackInfoAdditionalInfoAboutPetAdView(mainLabel: "Окрас:", infoPet: "Серый, белый, черный, в пятно")
            StackInfoAdditionalInfoAboutPetAdView(mainLabel: "Порода:", infoPet: "Большой швейцарский зенненхунд")
        }
    }
}

struct StackInfoAdditionalInfoAboutPetAdView: View {
    @State var mainLabel: String
    @State var infoPet: String
    var body: some View {
        HStack {
            Text(mainLabel)
                .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 12)))
                .foregroundColor(Color(PFAssets.darkGray.color))
            Spacer()
            Text(infoPet)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
        }
    }
}


#Preview {
    AdditionalInfoAboutPetAdView()
}
