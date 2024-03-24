//
//  SecondStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct SecondStepCreateAdView: View {
    @State private var isPresented = false
    var body: some View {
        ZStack {
            VStack {
                TopViewFirstStepCreateAdView()
                    .background(Color(PFAssets.darkBeige.color))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 0)
                ScrollView {
                    VStack {
                        PhotoScrollFirstStepCreateAdView()
                            .padding(.top, 24)
                            .padding(.leading, 16)
                        Divider()
                            .background(.white)
                            .padding(.top, 18)
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                            
                        ColorCollectionViewFirstStepCreateAdView()
                            .padding(.top, 18)
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                        Divider()
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                            .background(.white)
                        MedecineStatusSecondCreateAdView()
                            .padding(.top, 18)
                        Divider()
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                            .background(.white)
                        SpectialNoteViewFirstStepCreateAdView()
                            .padding(.top, 18)
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                        
                        
                    }
                    .padding(.bottom, 20)
                }
                Spacer()
                CustomOrangeButton(action: {
                    isPresented = true
                }, text: "Продолжить")
                .background(.clear)
                .padding(.leading, 16)
                .padding(.trailing, 15)
                .padding(.bottom, 10)
                .fullScreenCover(isPresented: $isPresented) {
                    ChoiceLocationView()
                        .background(Color(PFAssets.background.color))
                }
                
            }
        }
        .navigationBarHidden(true)
        .background(Color(PFAssets.background.color))
    }
}


#Preview {
    SecondStepCreateAdView()
}
