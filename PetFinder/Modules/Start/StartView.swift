//
//  StartView.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 16.03.24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                Button(action: {
                    
                }){
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: RegisterView()){
                            Text("Присоедениться")
                                .font(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18))
                                .foregroundColor(.white)
                                .padding(.vertical,20.5)
                        }
                        
                        Spacer()
                    }
                    .background(Color(cgColor: PFAssets.ginger.color.cgColor))
                    .cornerRadius(100)
                }
                
                Button(action: {
                    
                }){
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: MainView()){
                            Text("Пропустить")
                                .font(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18))
                                .foregroundColor(PFAssets.ginger.swiftUIColor)
                                .padding(.vertical,20.5)
                        }
                        
                        Spacer()
                    }
                    .background(Color(cgColor: PFAssets.background.color.cgColor))
                    .cornerRadius(100)
                }
                
                
            }.padding(.horizontal,16)
                .background(Color(cgColor: PFAssets.background.color.cgColor))
        }
    }
}

#Preview {
    StartView()
}
