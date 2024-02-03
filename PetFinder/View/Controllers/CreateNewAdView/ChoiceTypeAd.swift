//
//  ChoiceTypeAd.swift
//  OnboardingView
//
//  Created by Алексей Шамрей on 3.02.24.
//
import SwiftUI

struct ChoiceTypeAd: View {
    @State private var dataMassive = [["firstImage", "Пропал питомец"], ["secondImage", "Найден питомец"], ["thirdImage", "Пристроить питомца"], ["fourImage", "Завести питомца"]]
    
    var body: some View {
        TopView()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor(hex: 0xEFBFA5)))
            .ignoresSafeArea()
        List(dataMassive, id: \.self) { data in
                CellView(imageName: data[0], buttonLabel: data[1])
                    .background(Color.clear)
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: UIScreen.main.bounds.width)
            }
        .background(Color.clear)
        .padding(.top, -35)
        .padding(.horizontal, -19)
        .ignoresSafeArea()
        }
    }


struct TopView: View {
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
                print("123")
            }) {
                Image("closeButton")
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
            Image(uiImage: UIImage(named: imageName)!)
                .padding(.leading, 15)
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
            Image(uiImage: UIImage(named: "plusButton")!)
                .padding([.trailing, .top, .bottom], 16)
        }
    }
}


#Preview {
    ChoiceTypeAd()
}
