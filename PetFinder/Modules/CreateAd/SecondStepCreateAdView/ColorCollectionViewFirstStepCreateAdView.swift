//
//  ColorCollectionViewFirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct ColorCollectionViewFirstStepCreateAdView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Окрас")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.init(PFFontFamily.SFProText.medium.swiftUIFont(size: 20)))
            ColorCollection()
        }
    }
}

#Preview {
    ColorCollectionViewFirstStepCreateAdView()
}
