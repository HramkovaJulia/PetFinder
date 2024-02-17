//
//  ChangeCountryView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 14.02.24.
//

import SwiftUI

import SwiftUI

struct ChangeCountryView: View {
    @State private var selectedText = "Выберите страну"
    @State private var isExpanded = false
    @State private var listData: [[String]] = [["Выберите страну"]]

    var body: some View {
        VStack {
            DisclosureGroup(selectedText, isExpanded: $isExpanded) {
                ScrollView {
                    VStack(spacing: 10) {
                        Divider()
                            .background(Color(PFAssets.darkBeige.color))
                        
                        ForEach(listData.indices, id: \.self) { index in
                            Text(listData[index][1])
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 14)))
                                .foregroundColor(Color(PFAssets.black.color))
                                .onTapGesture {
                                    selectedText = listData[index][1]
                                    isExpanded = false
                                }
                        }
                    }
                }
                .frame(maxHeight: 200)
            }
            .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
            .foregroundColor(selectedText != "Выберите страну" ? Color(PFAssets.black.color) : Color(PFAssets.darkGray.color))
            .padding()
            .background(Color(PFAssets.white.color))
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(selectedText != "Выберите страну" ? Color(PFAssets.blue.color) : .clear)
            )
            .cornerRadius(25)
            .padding(.leading, 15)
            .padding(.trailing, 16)
        }
        .onAppear {
            listData = CountryManager().country
        }
    }
}


#Preview {
    ChangeCountryView()
}
