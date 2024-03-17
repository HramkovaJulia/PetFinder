//
//  MainView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                TopSectionMainView()
                    .background(Color(PFAssets.beige.color))
                ScrollView(showsIndicators: false){
                    AnimalCollectinView(massiveCell: [["sortImage", "Сортировка"], ["dog","Собаки"], ["cat","Кошки"], ["bird","Птицы"], ["mouse","Грызуны"], ["others","Прочее"]])
                        .padding(.leading, 16)
                    let dataManager = DataManager()
                    AdsView( dataManager: dataManager)
                        .foregroundColor(.black)
                        .padding(.horizontal,8)
                        .padding(.top, 24)
                    
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    MainView()
}
