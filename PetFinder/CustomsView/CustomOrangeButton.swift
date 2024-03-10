//
//  CustomOrangeButton.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct CustomOrangeButton: View {
    var action: () -> Void
    @State var text: String
    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                Text(text)
                    .foregroundColor(Color(PFAssets.white.color))
                    .font(.init(PFFontFamily.SFProText.semibold.font(size: 18)))
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

//#Preview {
//    CustomOrangeButton()
//}
