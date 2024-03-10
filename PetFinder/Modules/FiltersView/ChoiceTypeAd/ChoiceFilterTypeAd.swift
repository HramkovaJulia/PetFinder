//
//  ChoiceTypeAd.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 14.02.24.
//

import SwiftUI

import SwiftUI

struct ChoiceFilterTypeAd: View {
    @State var selectedSegment: Int? = nil
    @State private var typeArray = [["Пропал", PFAssets.lostImage.image], ["Найден", PFAssets.foundPet.image], ["Ищет дом", PFAssets.findingPet.image]]
    var body: some View {
        HStack(spacing: 14) {
            ForEach(0..<typeArray.count, id: \.self) { type in
                FilterTypeAd(imageName: typeArray[type][1] as! UIImage, label: typeArray[type][0] as! String, tag: type, selectedTag: $selectedSegment)
                    .background(Color(PFAssets.white.color))
                    .cornerRadius(12)
                    .onTapGesture {
                        self.selectedSegment = type
                    }
            }
       
        }
    }
}

struct FilterTypeAd: View {
    @State var imageName: UIImage
    @State var label: String
    @State var tag: Int
    @Binding var selectedTag: Int?
    var body: some View {
        VStack {
            Image(uiImage: imageName)
                .padding(.top, 10)
                .padding(.horizontal, 40.5)
      
            Text(label)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .foregroundColor(tag == selectedTag ? Color(PFAssets.black.color) : Color(PFAssets.darkGray.color) )
                .padding(.bottom, 10)
        }
        .background(tag == selectedTag ? Color(PFAssets.blue.color) : .clear)
    }
}


#Preview {
    ChoiceFilterTypeAd()
}
