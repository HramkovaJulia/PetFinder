//
//  FiltersSectionAboutPer.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct FiltersSectionAboutPet: View {
    var body: some View {
        VStack {
            Text("Данные питомца")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 18)
                .padding(.leading, 16)
            FiltersSectionSexPet()
            FiltersSectionOldPet()
            FiltersSectionBreedPet()
            Divider()
                .background(Color(PFAssets.white.color))
                .padding(.horizontal, 16)
                .padding(.vertical, 18)
        }
    }
}

struct FiltersSectionSexPet: View {
    var body: some View {
        VStack {
            Text("Пол")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                .padding(.bottom, 10)
            SexContentView()
        }
    }
}

struct FiltersSectionOldPet: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            Text("Возраст")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                .padding(.bottom, 10)
            CustomTextFieldView(placeholder: "1.5 года")
        }
    }
}

struct FiltersSectionBreedPet: View {
    var body: some View {
        Text("Порода")
            .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 24)
            .padding(.bottom, 10)
        CustomDropDownButtonView(selectedText: "Не имеет значения", placeholderText: "Не имеет значения")
    }
}



#Preview {
    FiltersSectionAboutPet()
}
