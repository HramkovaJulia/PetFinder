//
//  MainInfoAboutPetAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct MainInfoAboutPetAdView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 14) {
                ImageScrollView()
                    .frame(height: 295)
                NameSexMainInfoAboutPetAdView()
                    .padding(.leading, 14)
                MedecineStatusMainInfoAboutPetAdView()
                    .padding(.horizontal, 14)
                
                DescriptionMainInfoAboutPetAdView()
                    .padding(.horizontal, 14)
                    .padding(.bottom, 14)
            }
        }
    }
}

struct NameSexMainInfoAboutPetAdView: View {
    var body: some View {
        HStack(spacing: 10) {
            VStack {
                Image(uiImage: PFAssets.menSex.image)
                    .padding(.top, 12)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 11)
            }
            .frame(width: 40, height: 40)
            .background(Color(PFAssets.white.color))
            .cornerRadius(50)
            VStack(alignment: .leading, spacing: 4) {
                Text("Найдена собака c длинным именем")
                    .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 20)))
                Text("Сегодня, 16:40")
                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 12)))
                    .foregroundColor(Color(PFAssets.darkGray.color))
            }
            Spacer()
        }
    }
}

struct DescriptionMainInfoAboutPetAdView: View {
    @State private var lineLimit = 3
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Пропал пёс в районе центрального рынка. На нём был красный ошейник с косточкой, откликается на кличку Джек, понимает много команд. Очень дружелюбный, ко всем подходит, любит давать лапу. Очень прошу помочь найти любимца нашей семьи.")
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

struct MedecineStatusMainInfoAboutPetAdView: View {
    var body: some View {
        HStack(spacing: 14) {
            HStack {
                Image(uiImage: PFAssets.orangeSelect.image)
                    .padding(.vertical, 10)
                    .padding(.leading, 15)
                Text("Вакцинирован")
                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                    .padding(.trailing, 16)
                    .foregroundColor(Color(PFAssets.red.color))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(PFAssets.red.color), lineWidth: 1), alignment: .center
            )

            
            HStack {
                Image(uiImage: PFAssets.orangeSelect.image)
                    .padding(.vertical, 10)
                    .padding(.leading, 15)
                Text("Стерелизован")
                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                    .padding(.trailing, 16)
                    .foregroundColor(Color(PFAssets.red.color))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(PFAssets.red.color), lineWidth: 1), alignment: .center
            )
        }
    }
}

struct ButtonsStackMainInfoAboutPetAdView: View {
    @State private var imageArray: [UIImage] = [PFAssets.backButton.image, PFAssets.shareImage.image, PFAssets.adsStar.image, PFAssets.lostImage.image]
    var body: some View {
        HStack {
            ForEach(0..<imageArray.count, id: \.self) { image in
                if image == 0 {
                    ButtonStackMainInfoAboutPetAdView(image: imageArray[image])
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(50)
                        .frame(width: 32, height: 32)
                    Spacer()
                } else {
                    ButtonStackMainInfoAboutPetAdView(image: imageArray[image])
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(50)
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
}

struct ButtonStackMainInfoAboutPetAdView: View {
    @State var image: UIImage
    var body: some View {
        Button(action: {
            
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


#Preview {
    MainInfoAboutPetAdView()
}
