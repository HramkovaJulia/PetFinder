//
//  CustomDropDownTexFieldView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct CustomDropDownTexFieldView: View {
    @State var selectedText: String
    @State var placeholderText: String
    @State private var isExpanded = false
    @State private var listData: [String] = ["412", "321", "123"]
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                VStack {
                    if isExpanded {
                        DisclosureGroup("", isExpanded: $isExpanded) {
                            ForEach(listData.indices, id: \.self) { index in
                                Text(listData[index])
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.init(PFFontFamily.SFProText.light.swiftUIFont(size: 14)))
                                    .foregroundColor(Color(PFAssets.black.color))
                                    .onTapGesture {
                                        isExpanded = false
                                        selectedText = listData[index]
                                        
                                    }
                            }
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
                    }
                    Spacer()
                }
                VStack {
                    TextField(placeholderText, text: $selectedText)
                        .onChange(of: selectedText) { newValue in
                            isExpanded = !newValue.isEmpty
                        }
                        .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                        .foregroundColor(selectedText == placeholderText  ? Color(PFAssets.darkGray.color) : Color(PFAssets.black.color))
                        .padding()
                        .background( isExpanded ? .clear : Color(PFAssets.white.color))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(selectedText == placeholderText || isExpanded ?  .clear : Color(PFAssets.blue.color))
                        )
                        .cornerRadius(25)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}




#Preview {
    CustomDropDownTexFieldView(selectedText: "", placeholderText: "123")
}
