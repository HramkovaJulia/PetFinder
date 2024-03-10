//
//  FilterSectionPlaceFinding.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct FilterSectionPlaceFinding: View {
    var body: some View {
        VStack {
            Text("Где искать")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 18)
                .padding(.leading, 16)
            
            FilterSectionCountryFinding()
                .padding(.bottom, 16)
            FilterSectionCityFinding()
            Divider()
                .background(Color(PFAssets.white.color))
                .padding(.horizontal, 16)
                .padding(.vertical, 18)
               
            
            
        }
    }
}
struct FilterSectionCountryFinding: View {
    var body: some View {
        VStack {
            Text("Страна")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
            ChangeCountryView()
            
        }
       
    }
}

struct FilterSectionCityFinding: View {
    var body: some View {
        VStack {
            Text("Город")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
            ChangeCountryView()
        }
       
    }
}

#Preview {
    FilterSectionPlaceFinding()
}
