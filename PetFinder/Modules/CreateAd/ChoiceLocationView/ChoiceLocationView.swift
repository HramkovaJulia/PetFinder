//
//  ChoiceLocationView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct ChoiceLocationView: View {
    var body: some View {
        ZStack {
            VStack {
                TopViewChoiceLocationView()
                    .background(Color(PFAssets.darkBeige.color))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 0)
                GeolocationSectionChoiceLocationView()
                    .padding(.top, 24)
                    .padding(.leading, 16)
                    .padding(.trailing, 15)
                Spacer()
                
            }
        }
    }
}

#Preview {
    ChoiceLocationView()
}
