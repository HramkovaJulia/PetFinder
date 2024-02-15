//
//  FiltersAdditionallySectionView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 15.02.24.
//

import SwiftUI

struct FiltersAdditionallySectionView: View {
    var body: some View {
        VStack {
            Text("Дополнительно")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 18)
                .padding(.leading, 16)
            FiltersAdditionallyColorView()
            FiltersAdditionallyStatusMedicineView()
            Spacer()
        }
    }
}

struct FiltersAdditionallyColorView: View {
    @State private var isOnPriv = false
    @State private var isOnSter = false
    var body: some View {
        VStack {
            Text("Окрас")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                .padding(.bottom, 10)
            ColorCollection()
                .padding(.leading, 16)
                .padding(.trailing, 15)
        }
    }
}

struct FiltersAdditionallyStatusMedicineView: View {
    @State private var isOnPriv = false
    @State private var isOnSter = false
    var body: some View {
        VStack {
            HStack {
                Text("Привит")
                Spacer()
                Toggle(isOn: $isOnPriv) {
                    
                }
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("Стерилизован")
                Spacer()
                Toggle(isOn: $isOnSter) {
                    
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
    

#Preview {
    FiltersAdditionallySectionView()
}
