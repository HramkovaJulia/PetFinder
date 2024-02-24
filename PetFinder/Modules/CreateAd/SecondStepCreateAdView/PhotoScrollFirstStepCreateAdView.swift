//
//  PhotoScrollFirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct PhotoScrollFirstStepCreateAdView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Фото")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.init(PFFontFamily.SFProText.medium.swiftUIFont(size: 20)))
            PhotoScrollView()
        }
    }
}

#Preview {
    PhotoScrollFirstStepCreateAdView()
}
