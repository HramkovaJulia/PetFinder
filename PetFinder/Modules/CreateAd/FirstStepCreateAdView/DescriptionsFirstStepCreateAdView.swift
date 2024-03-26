//
//  DescriptionsFirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct DescriptionsFirstStepCreateAdView: View {
    @Binding var descriptionsFirstStepCreateAdModel: DescriptionsFirstStepCreateAdModel
    var body: some View {
        VStack {
            Text("Описание")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
            VStack(spacing: 1) {
                NamePetFirstStepCreateAdView(name: $descriptionsFirstStepCreateAdModel.name)
                OldPetFirstStepCreateAdView(age: $descriptionsFirstStepCreateAdModel.age)
                SexPetFirstStepCreateAdView(sex: $descriptionsFirstStepCreateAdModel.sex)
                BreedPetFirstStepCreateAdView()
          
            }
            Spacer()
        }
    }
}

struct NamePetFirstStepCreateAdView: View {
    @Binding var name: String
    var body: some View {
        VStack {
            Text("Кличка*")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            CustomTextFieldView(text: $name, placeholder: "Барсик", errorMessage: "Введите кличку питомца")
        }
    }
}

struct OldPetFirstStepCreateAdView: View {
    @Binding var age: String
    var body: some View {
        VStack {
            Text("Возраст")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            CustomTextFieldView(text: $age, placeholder: "1.5 года", errorMessage: "")
        }
    }
}

struct SexPetFirstStepCreateAdView: View {
    @Binding var sex: Sex
    var body: some View {
        VStack {
            Text("Пол")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            SexContentView()
        }
    }
}

struct BreedPetFirstStepCreateAdView: View {
    var body: some View {
        VStack {
            Text("Порода")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 14)
                .padding(.leading, 8)
            CustomDropDownButtonView(selectedText: "Нет данных", placeholderText: "Нет данных")
        }
    }
}


//#Preview {
//    DescriptionsFirstStepCreateAdView()
//}
