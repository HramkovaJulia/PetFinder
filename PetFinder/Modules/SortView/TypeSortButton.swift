//
//  TypeSortButton.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 26.02.24.
//

import SwiftUI

struct TypeSortButton: View {
    let mainText: String
    let descriptionText: String
    let isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(mainText)
                    .frame(alignment: .leading)
                    .padding(.leading, 16)
                    .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                    .padding(.top, 14)
                Text(descriptionText)
                    .font(.init(PFFontFamily.SFProText.regular.font(size: 12)))
                    .padding(.top, 4)
                    .padding(.leading, 16)
                    .padding(.bottom, 14)
            }
            Spacer()
            if isSelected {
                Button(action: {
                    
                }) {
                    
                    Image(uiImage: PFAssets.selectedSortButton.image)
                }
                .padding(.top, 24)
                .padding(.bottom, 27)
                .padding(.trailing, 16)
            }
  
        }
        .frame(maxWidth: .infinity)
        
    }
}

//#Preview {
//    TypeSortButton()
//}
