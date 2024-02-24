//
//  AdCellView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI

struct AdCellView: View {
    @State var data: LostPetCard
    var body: some View {
        VStack {
            Image(uiImage: PFAssets.dogBack.image)
                .resizable()
            Text(data.petName)
                .font(.init(PFFontFamily.SFProText.medium.swiftUIFont(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
            Text("Сегодня, 18:30")
                .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 12)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
            AdCellButtonHStackView()
                .padding(.horizontal, 12)
                .padding(.bottom, 14)
        }
        .frame(width: 164, height: 238)
        .background(Color(PFAssets.white.color))
        .cornerRadius(20)
    }
}


struct AdCellButtonHStackView: View {
    @State private var isFavorite: Bool = false
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(uiImage: PFAssets.mapPoint.image)
                Text("4 км от вас")
                    .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 14)))
                    .foregroundColor(Color(PFAssets.darkGray.color))
                    .underline()
            }
            Spacer()
            Button(action: {
                isFavorite.toggle()
            }) {
                
                Image(uiImage: isFavorite ? PFAssets.adsStarFull.image : PFAssets.adsStar.image)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    AdCellView(data: LostPetCard(petName: "Джек", petType: .dog, adType: .lost, createPost: "Сегодня, 12:33", breed: "Хаски", color: "Серый", age: 2, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (123) 456-7890", additionalInfo: "Носит синий ошейник.", vaccinated: true, sterilised: true))
}
