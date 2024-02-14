//
//  ColorCollectionView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 14.02.24.
//

import SwiftUI
import WrappingHStack

struct ColorCollection: View {
    @State var arrayColor: [String] = ["Белый", "Черный", "Рыжий", "Серый", "Коричневый", "Дымчатый", "Двухцветный", "Черепаховый", "Трехцветный", "В полоску", "В пятно", "+"]

    var body: some View {
        ScrollView(showsIndicators: false) {
            WrappingHStack(arrayColor, id: \.self) { color in
                ColorItemView(text: color)
                    .background(Color(PFAssets.white.color))
                    .cornerRadius(25)
                    .padding(.bottom, 12)
            }
        }
    }
}

struct ColorItemView: View {
    @State var text: String
    var body: some View {
        if text == "+" {
            Image(uiImage: PFAssets.clearPlus.image)
                .padding([.leading, .top], 10)
                .padding([.bottom, .trailing], 9)
        } else {
            Text(text)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCollection()
            
    }
}
