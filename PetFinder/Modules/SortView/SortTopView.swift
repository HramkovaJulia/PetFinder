//
//  SortTopView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 26.02.24.
//

import SwiftUI

struct SortTopView: View {
    var body: some View {
        HStack {
            Text("Сортировка")
                .font(.init(PFFontFamily.SFProText.semibold.font(size: 24)))
                .padding(.leading, 16)
                .padding(.top, 24)
            Spacer()
            Button(action: {
            }) {
                Image(uiImage: PFAssets.sortClose.image)
            }
            .padding(.trailing, 16)
            .padding(.top, 29)
        }
    }
}

#Preview {
    SortTopView()
}
