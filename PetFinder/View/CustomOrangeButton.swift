//
//  CustomOrangeButton.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct CustomOrangeButton: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                Text("Применить")
                    .foregroundColor(Color(PFAssets.white.color))
                    .font(.init(PFFontFamily.SFProText.semibold.font(size: 16)))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 10)
            }
            .frame(maxWidth: .infinity)
            .background(Color(PFAssets.red.color))
        .cornerRadius(25)
        }
        .background(.clear)
    }
}

#Preview {
    CustomOrangeButton()
}
