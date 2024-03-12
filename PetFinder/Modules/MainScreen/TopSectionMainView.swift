//
//  TopSectionMainView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI

struct TopSectionMainView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Доска объявлений")
                    .foregroundStyle(Color(PFAssets.white.color))
                    .font(.init(PFFontFamily.SFProText.semibold.font(size: 24)))
                    .padding(.top, 8)
                    .padding(.leading, 16)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(uiImage: PFAssets.bell.image)
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .padding(.top, 8)
                .padding(.trailing, 15)
                
            }
            CustomSearchViewMainView()
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 20)
        }
    }
}

struct CustomSearchViewMainView: View {
    @State var text: String = ""
    @State var isPresented: Bool = false
    var body: some View {
        TextField("Поиск", text: $text)
            .padding(.leading, 24)
            .padding(.trailing, 40)
            .frame(height: 48)
            .background(Color(PFAssets.white.color))
            .cornerRadius(25)
            .overlay(
                Button(action: {
                    if text.isEmpty {
                        isPresented = true
                    } else {
                        text = ""
                        isPresented = false
                    }
                        
                }) {
                    if text.isEmpty {
                        Image(uiImage: PFAssets.filters.image)
                            .padding()
                            .tint(.black)
                    } else {
                        Image(systemName: "xmark")
                            .padding()
                            .tint(.black)
                    }
                }
                .padding(.trailing, 8),
                alignment: .trailing
            )
            .sheet(isPresented: $isPresented, content: {
                FiltersView()
            })

    }
}

#Preview {
    TopSectionMainView()
}
