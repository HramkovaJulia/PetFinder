//
//  CustomDropDownButtonView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct CustomDropDownButtonView: View {
    @State var selectedText: String
    @State var placeholderText: String
    @State private var isExpanded = false
    @State private var listData: [String] = [String]()
        var body: some View {
            VStack {
                DisclosureGroup(selectedText, isExpanded: $isExpanded) {
                    ScrollView {
                        VStack(spacing: 10) {
                            Divider()
                                .background(Color(PFAssets.darkBeige.color))
                            
                            ForEach(listData.indices, id: \.self) { index in
                                Text(listData[index])
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 14)))
                                    .foregroundColor(Color(PFAssets.black.color))
                                    .onTapGesture {
                                        selectedText = listData[index]
                                        isExpanded = false
                                    }
                            }
                        }
                    }
                    .frame(maxHeight: 200)
                }
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .foregroundColor(selectedText == placeholderText  ? Color(PFAssets.darkGray.color) : Color(PFAssets.black.color))
                .padding()
                .background(Color(PFAssets.white.color))
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(selectedText == placeholderText ?  .clear : Color(PFAssets.blue.color))
                )
                .cornerRadius(25)
//                .padding(.leading, 15)
//                .padding(.trailing, 16)
            }
        }
}
