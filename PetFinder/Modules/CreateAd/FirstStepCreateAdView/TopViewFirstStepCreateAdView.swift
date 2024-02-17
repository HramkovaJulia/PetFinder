//
//  TopViewFirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct TopViewFirstStepCreateAdView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(uiImage: PFAssets.closedButton.image)
            }
            .padding(.top, 14)
            .padding(.leading, 16)
            .padding(.bottom, 20)
            Text("Данные о питомце")
                .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 24)))
                .foregroundColor(Color(PFAssets.white.color))
                .padding(.leading, 14)
                .padding(.top, 15.5)
                .padding(.bottom, 22.5)
            Spacer()
        }
    }
}

#Preview {
    TopViewFirstStepCreateAdView()
}
