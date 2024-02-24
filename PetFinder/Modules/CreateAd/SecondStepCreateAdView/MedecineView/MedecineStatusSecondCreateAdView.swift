//
//  MedecineStatusSecondCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct MedecineStatusSecondCreateAdView: View {
    @State var isOn: Bool = false
    var body: some View {
        VStack(spacing: 16) {
            TopViewMedecineStatusSecondCreateAdView(isOn: $isOn)
            StacksButtonMedecineStatusSecondCreateAdView(isDesableStatus: $isOn)
                .background(Color(PFAssets.white.color))
                .cornerRadius(12)
                .opacity(isOn ? 1 : 0.4)
                .disabled(isOn ? false : true)
        }
    }
}

struct TopViewMedecineStatusSecondCreateAdView: View {
    @Binding var isOn: Bool
    var body: some View {
        HStack {
            Text("Медицинские данные")
                .font(.init(PFFontFamily.SFProText.medium.swiftUIFont(size: 20)))
                .padding(.leading, 16)
            Spacer()
            Toggle("", isOn: $isOn)
                .tint(Color(PFAssets.blue.color))
                .frame(width: 51, height: 31)
                .padding(.trailing, 16)
            
        }
    }
}

struct StacksButtonMedecineStatusSecondCreateAdView: View {
    @Binding var isDesableStatus: Bool
    var body: some View {
        HStack {
            StackButtonMedecineStatusSecondCreateAdView(typeText: "Привит", isDesableStatus: $isDesableStatus)
                .padding([.leading, .bottom, .top], 18)
            StackButtonMedecineStatusSecondCreateAdView(isOn: nil, typeText: "Стерилизован", isDesableStatus: $isDesableStatus)
                .padding([.leading, .bottom, .top], 18)
        }
    }
}

struct StackButtonMedecineStatusSecondCreateAdView: View {
    @State var isOn: Bool? = nil
    @State var typeText: String
    @Binding var isDesableStatus: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(typeText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 12)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 16)))
            VStack(alignment: .leading, spacing: 14) {
                RadioButton(isOn: $isOn, text: "Да", value: true, isDisabled: $isDesableStatus)
                RadioButton(isOn: $isOn, text: "Нет", value: false, isDisabled: $isDesableStatus)
            }
            
        }
    }
}

struct RadioButton: View {
    @Binding var isOn: Bool?
    let text: String
    let value: Bool
    @Binding var isDisabled: Bool
    
    var body: some View {
        Button(action: {
            if isDisabled {
                isOn = value
            } else {
                isOn = nil
            }
        }) {
            HStack {
                Image(uiImage: isOn == value ?  PFAssets.radioSelect.image : (isOn == nil ? PFAssets.radioDeselect.image : PFAssets.radioDeselect.image))
                Text(text)
                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                    .padding(.leading, 6)
                    .foregroundColor(Color(PFAssets.darkGray.color))
            }
        }
    }
}

#Preview {
    MedecineStatusSecondCreateAdView()
}
