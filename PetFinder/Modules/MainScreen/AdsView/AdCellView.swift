//
//  AdCellView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI

struct AdCellView: View {
    @Binding var model : PostModel
    var body: some View {
        VStack {
            Image(uiImage: model.mainInfoAboutPetModel.imageScrollModel.images.first ?? UIImage()) // потом сделает из assets картинку
                .resizable()
            Text(model.mainInfoAboutPetModel.nameSexMainInfoAboutPetModel.titleOfPost)
                .font(.init(PFFontFamily.SFProText.medium.swiftUIFont(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
            Text(model.mainInfoAboutPetModel.nameSexMainInfoAboutPetModel.Date)
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

//#Preview {
//    AdCellView(
//               model: PostModel(globalInfoAboutPet: GlobalInfoAboutPet(statusOFPost: .lookingForAHome, kindOfAnimal: .dog), mainInfoAboutPetModel: MainInfoAboutPetAdModel(imageScrollModel: ImageScrollModel(images: [UIImage()]), nameSexMainInfoAboutPetModel: NameSexMainInfoAboutPetAdModel(sex: .she, titleOfPost: "пусто", Date: "пусто"), medecineStatusMainInfoAboutPetAdModel: MedecineStatusMainInfoAboutPetAdModel(vaccinated: true, sterilized: true), descriptionMainInfoAboutPetAdModel: DescriptionMainInfoAboutPetAdModel(description: "пусто")), additionalInfoAboutPetAdModel: AdditionalInfoAboutPetAdModel(stacksInfoAdditionalInfoAboutPetAdModel: StacksInfoAdditionalInfoAboutPetAdModel(stackInfoAdditionalInfoAboutPetAdModel: [StackInfoAdditionalInfoAboutPetAdModel(mainLabel: "хуй", infoPet: "хуй")])),mapInfoInfoAboutPetAdModel: MapInfoInfoAboutPetAdModel(typeOfAdress: .location, possitionButtonsMapInfoInfoAboutPetAdModel: PossitionButtonsMapInfoInfoAboutPetAdModel(adress: "Фиолетовая 45"), stackMapViewInfoInfoAboutPetAdModel: StackMapViewInfoInfoAboutPetAdModel()), specialnoteInfoAboutPetAdModel: SpecialnoteInfoAboutPetAdModel(specialSigns: "пусто")))
//}
