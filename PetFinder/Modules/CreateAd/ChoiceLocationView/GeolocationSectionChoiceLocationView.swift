//
//  GeolocationSectionChoiceLocationView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct GeolocationSectionChoiceLocationView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("Геолокация*")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 16)
                CurrentPossitionSectionChoiceLocationView()
                    .padding(.bottom, 8)
                CurrentContryButtonChoiceLocationView()
                    .padding(.bottom, 12)
                    CustomDropDownTexFieldView(selectedText: "", placeholderText: "Адрес местонахождения или пропажи")
                

                ShowMapButtonChoiceLocationView()
                Divider()
                    .padding(.vertical, 18)
                CustomTextEditorSectionChoiceLocationView()
            }
            Spacer()
            CustomOrangeButton(action: {
                
            }, text: "Создать")
        }
    }
}

struct CurrentPossitionSectionChoiceLocationView: View {
    @State var isOn: Bool = false
    var body: some View {
        HStack {
            Text("Текущее местонахождение")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.init(PFFontFamily.SFProText.regular.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            Toggle("", isOn: $isOn)
                .tint(Color(PFAssets.blue.color))
                .frame(width: 51, height: 31)
                .padding(.trailing, 15)
        }
    }
}

struct CurrentContryButtonChoiceLocationView: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Text("Россия")
                    .font(.init(PFFontFamily.SFProText.light.font(size: 16)))
                    .underline()
            }
            .padding(.leading, 8)
            Spacer()
        }
    }
}

struct ShowMapButtonChoiceLocationView: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(uiImage: PFAssets.mapPoint.image)
                Text("Указать на карте")
                    .font(.init(PFFontFamily.SFProText.light.font(size: 16)))
                    .underline()
            }
            .padding(.leading, 8)
            Spacer()
        }
    }
}

struct CustomTextEditorSectionChoiceLocationView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Текст объявления")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
            CustomTextEditor()
        }
    }
}


#Preview {
    GeolocationSectionChoiceLocationView()
}
