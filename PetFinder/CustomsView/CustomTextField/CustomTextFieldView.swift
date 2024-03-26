//
//  CustomTextFieldView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String 
    @State var placeholder: String
    @State var errorMessage: String
    @State var hasEnteredText: Bool = false
    @State var hasBeenActivated: Bool = false
    
    private var newText: String? {
        return hasEnteredText && text.isEmpty ? "" : nil
    }
    
    var body: some View {
        VStack(spacing: 6) {
            TextField(placeholder, text: $text)
                .onChange(of: text) { newValue in
                    if !newValue.isEmpty {
                        hasEnteredText = true
                        hasBeenActivated = true
                    } else {
                        hasBeenActivated = false
                    }
                }
                .padding(.vertical, 18)
                .padding(.leading, 24)
                .background(Color(PFAssets.white.color))
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(newText != nil ? Color.orange : (hasBeenActivated ? Color(PFAssets.blue.color) : .clear))
                )
            
            Text(errorMessage)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 28)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 12)))
                .foregroundColor(Color(PFAssets.red.color))
                .opacity(self.newText == nil ? 0 : 1)
        }
    }
}



