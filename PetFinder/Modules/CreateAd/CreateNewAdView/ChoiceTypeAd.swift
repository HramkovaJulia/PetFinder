//
//  ChoiceTypeAd.swift
//  OnboardingView
//
//  Created by Алексей Шамрей on 3.02.24.
//
import SwiftUI
import UIKit

struct AdvertVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CreatePetAdvertViewController {
        return CreatePetAdvertViewController()
    }

    func updateUIViewController(_ uiViewController: CreatePetAdvertViewController, context: Context) {
    }
}

struct ChoiceTypeAd: View {
    var dismissAction: () -> Void
    @State private var isPresented = false
    @State private var dataMassive = [["firstImage", "Пропал питомец"], ["secondImage", "Найден питомец"], ["thirdImage", "Пристроить питомца"], ["fourImage", "Завести питомца"]]

    
    var body: some View {
        VStack {
            TopView(dismissAction: dismissAction)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor(hex: 0xEFBFA5)))
                .ignoresSafeArea()
            VStack {
                ForEach(dataMassive, id: \.self) { data in
                    CellView(imageName: data[0], buttonLabel: data[1])
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .padding(.top, 16)
                        .onTapGesture {
                            print(data[0])
                            isPresented = true
                        }.fullScreenCover(isPresented: $isPresented){
                            AdvertVC()
                                .ignoresSafeArea()
                        }
                        
                }
            }
            .background(Color(UIColor(hex: 0xFCF4EF)))
            .padding(.top, -24)
            Spacer()
        }
        .background(Color(UIColor(hex: 0xFCF4EF)))
    }
}

struct TopView: View {
    var dismissAction: () -> Void
    var body: some View {
        HStack {
            Text("Новое объявление")
                .foregroundStyle(.white)
                .padding(.top, 61.5)
                .padding(.leading, 16)
                .padding(.bottom, 21.5)
                .font(.init(UIFont.sfProText(ofSize: 24, weight: .semiBold)))
            Spacer()
            Button(action: {
                self.dismissAction()
            }) {
                Image(uiImage: PFAssets.closeButton.image)
            }
            .padding(.top, 61.5)
            .padding(.trailing, 15)
            .padding(.bottom, 21.5)
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct CellView: View {
    @State var imageName: String
    @State var buttonLabel: String
    
    var body: some View {
        let isFourImage = imageName == "fourImage"
        let backgroundColor = isFourImage ? Color(UIColor(hex: 0xF8E0CA)) : Color(UIColor(hex: 0xBCE3FF))
        let buttonColor = isFourImage ? Color(UIColor(hex: 0xFF975F)) : Color(UIColor(hex: 0x6DC2FF))
        
        return HStack(spacing: 35) {
            switch imageName {
            case "firstImage":
                Image(uiImage: PFAssets.firstImage.image)
                    .padding(.leading, 15)
            case "secondImage":
                Image(uiImage: PFAssets.secondImage.image)
                    .padding(.leading, 15)
            case "thirdImage":
                Image(uiImage: PFAssets.thirdImage.image)
                    .padding(.leading, 15)
            default :
                Image(uiImage: PFAssets.fourImage.image)
                    .padding(.leading, 15)
            }
            ButtonView(buttonLabel: buttonLabel)
                .frame(width: 180, height: 70)
                .background(buttonColor)
                .cornerRadius(16)
                .padding(.trailing, 16)
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.vertical, -10)
        .background(backgroundColor)
    }
}


struct ButtonView: View {
    @State var buttonLabel: String
    var body: some View {
        HStack {
            Text(buttonLabel)
                .font(.init(UIFont.sfProText(ofSize: 16, weight: .light)))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .padding([.leading, .top, .bottom], 14)
            Spacer()
            Image(uiImage: PFAssets.plusButton.image)
                .padding([.trailing, .top, .bottom], 16)
        }
    }
}


//#Preview {
//    ChoiceTypeAd()
//}
