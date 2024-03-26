//
//  FirstStepCreateAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct FirstStepCreateAdView: View {
    @Environment(\.dismiss) var dismiss
  
    @ObservedObject var presenter: FirstStepCreateAdPresenter
    
    init(interactor: FirstStepCreateAdInteractor) {
        let adPresenter = FirstStepCreateAdPresenter(interactor: interactor)
        self.presenter = adPresenter
            }
    
    var body: some View {
        ZStack {
            NavigationStack{
            VStack {
                TopViewFirstStepCreateAdView()
                    .background(Color(PFAssets.darkBeige.color))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 0)
                ScrollView {
                    VStack {
                        HStack{
                            Text("Вид питомца").font(PFFontFamily.SFProText.medium.swiftUIFont(size: 20))
                            Spacer()
                        }
                        .padding(.leading,16)
                        .padding(.top,20)

                        ChoiceFilterTypeAd(currentStatus: $presenter.statusOfPost)
                            .padding(.top,16)
                            .padding(.horizontal,16)
                        
                        HStack{Spacer()}.frame(height: 1.5)
                            .background(PFAssets.white.swiftUIColor)
                            .padding(.horizontal,16)
                            .padding(.vertical,18)
                        
                        
                        KindOFAnimals(selectedPet: $presenter.selectedPet)
                            .padding(.horizontal, 16)
                        HStack{Spacer()}.frame(height: 1.5)
                            .background(PFAssets.white.swiftUIColor)
                            .padding(.horizontal,16)
                            .padding(.top, 20)
                            
                        DescriptionsFirstStepCreateAdView(descriptionsFirstStepCreateAdModel: $presenter.descriptionsFirstStepCreateAdModel)
                            .padding(.top, 20)
                            .padding(.horizontal, 16)
                            
                        Spacer()
                    }
                    
                }
                
                    NavigationLink(destination: SecondStepCreateAdView()){
                        HStack {
                            Spacer()
                            Text("Далее").font(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18))
                                .foregroundColor(.white)
                            Spacer()
                        }.frame( height: 62, alignment: .center)
                            .background(PFAssets.ginger.swiftUIColor)
                            .cornerRadius(100).padding(.horizontal,16)
                            
                    }
                }
            }
            .background(Color(PFAssets.background.color))
        }.navigationBarHidden(true)
        
        
        
        
    }
}

struct DescriptionsFirstStepCreateAdModel {
    var name: String
    var age : String
    var sex : Sex
}

//#Preview {
//    FirstStepCreateAdView( )
//}

