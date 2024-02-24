//
//  SpectialNoteViewFirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct SpectialNoteViewFirstStepCreateAdView: View {
    var body: some View {
        VStack {
            Text("Особые приметы")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.init(PFFontFamily.SFProText.medium.swiftUIFont(size: 20)))
            CustomTextEditor()
        }
        .padding(.bottom, 15)
    }
}

#Preview {
    SpectialNoteViewFirstStepCreateAdView()
}
