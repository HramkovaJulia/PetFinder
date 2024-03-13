//
//  MainInfoAboutPetAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct MainInfoAboutPetAdView: View {
    
    @Binding var model: MainInfoAboutPetAdModel
    
    var body: some View {
        
        VStack(spacing: 14) {
            ImageScrollView(model: $model.imageScrollModel)
                .frame(height: 295)
            NameSexMainInfoAboutPetAdView(model: $model.nameSexMainInfoAboutPetModel)
                .padding(.leading, 14)
            MedecineStatusMainInfoAboutPetAdView(model: $model.medecineStatusMainInfoAboutPetAdModel)
                .padding(.horizontal, 14)
            
            DescriptionMainInfoAboutPetAdView(model: $model.descriptionMainInfoAboutPetAdModel)
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
        }
    }
}

struct NameSexMainInfoAboutPetAdView: View {
    
    @Binding var model: NameSexMainInfoAboutPetAdModel
    
    var body: some View {
        HStack(spacing: 10) {
            VStack {
                
                Image( uiImage: {
                        switch model.sex {
                        case .he: PFAssets.menSex.image
                        case .she: PFAssets.womenSex.image
                        case .it: PFAssets.otherSex.image
                        }
                    }())
                        .padding(.top, 12)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 11)
                    
            }
            .frame(width: 40, height: 40)
            .background(Color(PFAssets.white.color))
            .cornerRadius(50)
            VStack(alignment: .leading, spacing: 4) {
                Text(model.titleOfPost)
                    .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 20)))
                Text(model.Date)
                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 12)))
                    .foregroundColor(Color(PFAssets.darkGray.color))
            }
            Spacer()
        }
    }
}

struct DescriptionMainInfoAboutPetAdView: View {
    
    @Binding var model: DescriptionMainInfoAboutPetAdModel
    @State private var lineLimit = 3
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.description)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .lineLimit(lineLimit)
            Button(action: {
                if lineLimit == 3 {
                    lineLimit = 100
                } else {
                    lineLimit = 3
                }
            }) {
                Text("Показать полностью")
                    .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 14)))
                    .foregroundColor(Color(PFAssets.darkGray.color))
                    .underline()
            }
        }
    }
}

struct Vaccinated: View {
    
    var body: some View {
        HStack {
            Spacer()
            Image(uiImage: PFAssets.orangeSelect.image )
                .padding(.vertical, 10)
                .padding(.leading, 15)
            Text("Вакцинирован")
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .foregroundColor(Color(PFAssets.red.color))
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(PFAssets.red.color), lineWidth: 1), alignment: .center
        )
    }
    
}

struct Sterilized: View {
    
    var body: some View {
        
        HStack {
            Spacer()
            Image(uiImage: PFAssets.orangeSelect.image)
                .padding(.vertical, 10)
                .padding(.leading, 15)
            Text("Стерелизован")
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .padding(.trailing, 16)
                .foregroundColor(Color(PFAssets.red.color))
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(PFAssets.red.color), lineWidth: 1), alignment: .center
        )
        
    }
    
}

struct MedecineStatusMainInfoAboutPetAdView: View {
    
    @Binding var model: MedecineStatusMainInfoAboutPetAdModel

    var body: some View {
        switch (model.vaccinated, model.sterilized) {
        case (true, false): Vaccinated()
        case (false , true): Sterilized()
        case (true,true):
            HStack (spacing: 14){
                Vaccinated()
                Sterilized()
            }
        case (false,false): VStack{}.frame(width: 0,height: 0)
        }
    }
}
    
    struct ButtonsStackMainInfoAboutPetAdView: View {
        var backAction: () -> Void
        @State private var imageArray: [UIImage] = [PFAssets.backButton.image, PFAssets.shareImage.image, PFAssets.adsStar.image, PFAssets.lostImage.image]
        var body: some View {
            HStack {
                ForEach(0..<imageArray.count, id: \.self) { image in
                        ButtonStackMainInfoAboutPetAdView( backAction: {backAction()}, image: imageArray[image])
                            .background(Color(PFAssets.white.color))
                            .cornerRadius(50)
                            .frame(width: 32, height: 32)
                 
                    image == 0 ? Spacer() : nil 
                    
                }
            }
        }
    }
    
    struct ButtonStackMainInfoAboutPetAdView: View {
        var backAction: () -> Void
        @State var image: UIImage
        var body: some View {
            Button(action: {
                
                switch image {
                case PFAssets.backButton.image: backAction()
                default : break
                }
                
            }) {
                switch image {
                case PFAssets.lostImage.image:
                    Image(uiImage: image)
                        .resizable()
                        .padding(7)
                case PFAssets.adsStar.image:
                    Image(uiImage: image)
                        .resizable()
                        .padding(7)
                case PFAssets.shareImage.image:
                    Image(uiImage: image)
                        .resizable()
                        .padding(7)
                default:
                    Image(uiImage: image)
                        .padding(.vertical, 9)
                        .padding(.leading, 12)
                        .padding(.trailing, 14)
                }
            }
        }
    }
    
    
//    #Preview {
//        
//        VStack{
//            
//            DescriptionMainInfoAboutPetAdView(description: "Пропал пёс в районе центрального рынка. На нём был красный ошейник с косточкой, откликается на кличку Джек, понимает много команд. Очень дружелюбный, ко всем подходит, любит давать лапу. Очень прошу помочь найти любимца нашей семьи.")
//            
//            VStack{
//                Color.red
//            }.frame(height: 10)
//            
//           
//            
//            NameSexMainInfoAboutPetAdView(imageOfSex: PFAssets.menSex.image,titleOfPost: "Найдена собака с длинным именем", Date: "Сегодня 16:40")
//            
//            VStack{
//                Color.red
//            }.frame(height: 10)
//            
//            MedecineStatusMainInfoAboutPetAdView(vaccinated: true, sterilized: true)
//        }
//        
//        
//    }



    //        HStack(spacing: 14) {
    //            HStack {
    //                Image(uiImage: PFAssets.orangeSelect.image )
    //                    .padding(.vertical, 10)
    //                    .padding(.leading, 15)
    //                Text("Вакцинирован")
    //                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
    //                    .padding(.trailing, 16)
    //                    .foregroundColor(Color(PFAssets.red.color))
    //            }
    //            .overlay(
    //                RoundedRectangle(cornerRadius: 10)
    //                    .stroke(Color(PFAssets.red.color), lineWidth: 1), alignment: .center
    //            )
    //
    //            HStack {
    //                Image(uiImage: PFAssets.orangeSelect.image)
    //                    .padding(.vertical, 10)
    //                    .padding(.leading, 15)
    //                Text("Стерелизован")
    //                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
    //                    .padding(.trailing, 16)
    //                    .foregroundColor(Color(PFAssets.red.color))
    //            }
    //            .overlay(
    //                RoundedRectangle(cornerRadius: 10)
    //                    .stroke(Color(PFAssets.red.color), lineWidth: 1), alignment: .center
    //            )
    //        }
