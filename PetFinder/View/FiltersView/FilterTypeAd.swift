//
//  FilterTypeAd.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct FilterSectionTypeAd: View {
    var body: some View {
        VStack {
            Text("Тип объявления")
                .font(.init(PFFontFamily.SFProText.semibold.font(size: 24)))
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            ChoiceFilterTypeAd()
            Divider()
                .background(Color(PFAssets.white.color))
                .padding(.horizontal, 16)
                .padding(.vertical, 18)
        }
    }
}

#Preview {
    FilterSectionTypeAd()
}
