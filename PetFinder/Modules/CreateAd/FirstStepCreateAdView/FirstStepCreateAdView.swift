//
//  FirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct SecondVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SecondCreateViewController {
        return SecondCreateViewController()
    }

    func updateUIViewController(_ uiViewController: SecondCreateViewController, context: Context) {
    }
}

struct FirstStepCreateAdView: View {
    @Environment(\.dismiss) var dismiss
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
                        SelectTypePetView()
                            .padding(.top, 24)
                            .padding(.leading, 16)
                        Divider()
                            .background(Color(PFAssets.white.color))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                        DescriptionsFirstStepCreateAdView()
                            .padding(.top, 20)
                            .padding(.leading, 16)
                            .padding(.trailing, 15)
                        Spacer()
                    }
                    
                }
                CustomOrangeButton(action: {
                    isPresented = true
                })
                    .background(.clear)
                    .padding(.leading, 16)
                    .padding(.trailing, 15)
                    .padding(.bottom, 10)
                    .fullScreenCover(isPresented: $isPresented){
                        SecondVC()
                            .ignoresSafeArea()
                    }
               
            }
            .background(Color(PFAssets.background.color))
        }
        
        
    }
}


#Preview {
    FirstStepCreateAdView()
}
