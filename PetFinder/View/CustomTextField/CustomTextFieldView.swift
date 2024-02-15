//
//  CustomTextFieldView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct CustomTextFieldView: View {
    @State var text: String = ""
    @State var placeholder: String
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.vertical, 18)
            .padding(.leading, 24)
            .background(Color(PFAssets.white.color))
            .cornerRadius(25)
            .padding(.horizontal, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(text.isEmpty ? .clear : Color(PFAssets.blue.color))
            )
    }
}
