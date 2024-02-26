//
//  FiltersTopView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct FiltersTopView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Фильтры")
                    .font(.init(PFFontFamily.SFProText.semibold.font(size: 24)))
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(uiImage: PFAssets.sortClose.image)
                })
            }
            HStack {
                Button(action: {
                    
                }) {
                    Text("Сбросить")
                        .font(.init(PFFontFamily.SFProText.regular.font(size: 16)))
                }
                Spacer()
            }
            Divider()
                .padding(.vertical, 20)
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FiltersTopView()
}
