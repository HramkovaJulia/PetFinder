//
//  RegisterView.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 16.03.24.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(uiImage: PFAssets.backspaceButton.image)
                        .resizable()
                        .frame(width: 32,height: 32)
                }.padding(.trailing,8)
                
                Text("Добро пожаловать")
                    .font(PFFontFamily.SFProText.semibold.swiftUIFont(size: 24))
                
                Spacer()
            }.padding(.bottom,24)
            
            VStack{
                HStack{
                    Text("Телефон или почта")
                        .font(PFFontFamily.SFProText.medium.swiftUIFont(size:16))
                        .padding(.leading,8)
                    Spacer()
                }.padding(.bottom,10)
                
                HStack {
                    Text("ivanov@example. com")
                        .font(PFFontFamily.SFProText.light.swiftUIFont(size: 14))
                        .foregroundColor(Color(uiColor: .lightGray))
                        .padding(.leading,24)
                    Spacer()
                }.frame(height: 53)
                    .foregroundColor(Color(uiColor: .lightGray))
                    .background(.white)
                    .cornerRadius(100)
                    .padding(.bottom,18)
                
                HStack{
                    Text("Пароль")
                        .font(PFFontFamily.SFProText.medium.swiftUIFont(size: 16))
                        .padding(.leading,8)
                    Spacer()
                }.padding(.bottom,10)
                
                HStack{
                    Text("parol")
                        .padding(.leading,24)
                        
                    Spacer(minLength: 8)
                    Button(action: {
                        
                    }){
                        // картинки называются hide и show
                        Image(uiImage: PFAssets.hide.image)
                            .resizable()
                            .frame(width: 24,height: 22)
                    }.padding(.trailing,24)
                    
                }.frame(height: 54)
                    .background(.white)
                    .cornerRadius(100)
                    .padding(.bottom,10)
                
                HStack{
                    Text("Забыли пароль?")
                        .font(PFFontFamily.SFProText.regular.swiftUIFont(size: 14))
                        .padding(.horizontal,8)
                    Spacer()
                }.foregroundColor(Color(uiColor: PFAssets.deepBlue.color))
                
                HStack{
                    
                    HStack{Spacer()}
                        .frame(height: 1)
                        .frame(width: .infinity)
                        .background(Color.white)
                        .padding(.trailing,6)
                    
                    Text("Или")
                        .font(PFFontFamily.SFProText.regular.swiftUIFont(size: 12))
                        .foregroundColor(Color(cgColor: PFAssets.darkGray.color.cgColor))
                    
                    HStack{Spacer()}
                        .frame(height: 1)
                        .frame(width: .infinity)
                        .background(Color.white)
                        .padding(.leading,6)
                    
                }.padding(.vertical,32)
                
                HStack{
                    Spacer()
                    Image(uiImage: PFAssets.google.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing,0.5)
                    
                    Text("Google")
                        .font(PFFontFamily.SFProText.medium.swiftUIFont(size: 16))
                    
                    Spacer()
                    
                }.frame(height: 56)
                    .background(Color.white)
                    .cornerRadius(100)
                    .padding(.bottom,24)
                
                HStack{
                    Spacer()
                    Image(uiImage: PFAssets.apple.image)
                        .resizable()
                        .frame(width: 20, height: 54)
                        .padding(.trailing,0.5)
                    
                    Text("Apple ID")
                        .font(PFFontFamily.SFProText.medium.swiftUIFont(size: 16))
                        
                    
                    Spacer()
                    
                }.frame(height: 56)
                    .background(Color.black)
                    .cornerRadius(100)
                    .foregroundColor(.white)
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Spacer()
            
            Button(action: {
                
            }){
                HStack{
                    Spacer()
                    Text("Войти")
                        .font(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18))
                        .foregroundColor(.white)
                        .padding(.vertical,20.5)
                    Spacer()
                }
                .background(Color(cgColor: PFAssets.ginger.color.cgColor))
                .cornerRadius(100)
            }
            
            Button(action: {
                
            }){
                HStack{
                    Spacer()
                    Text("Зарегестрироваться")
                        .font(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18))
                        .foregroundColor(PFAssets.ginger.swiftUIColor)
                        .padding(.vertical,20.5)
                    Spacer()
                }
                .background(Color(cgColor: PFAssets.background.color.cgColor))
                .cornerRadius(100)
            }
            
        }.padding(.horizontal,16)
            .background(Color(cgColor: PFAssets.background.color.cgColor))
    }
}

#Preview {
    RegisterView()
}
