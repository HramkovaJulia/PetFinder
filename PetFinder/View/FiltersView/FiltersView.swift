//
//  FiltersView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct FiltersView: View {
    var body: some View {
        ZStack {
            VStack {
                FiltersTopView()
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                
                
                ScrollView {
                    VStack {
                        FilterSectionTypeAd()
                        FilterSectionPlaceFinding()
                        FiltersSectionAboutPet()
                        FiltersAdditionallySectionView()
                    }
                }
                .background(.clear)
                
                CustomOrangeButton()
                    .background(.clear)
                    .padding(.leading, 16)
                    .padding(.trailing, 15)
                    .padding(.bottom, 10)
                    
            }
        }
        .background(.clear)
    }
}



#Preview {
    FiltersView()
}
