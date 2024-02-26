//
//  MainView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TopSectionMainView()
                .background(Color(PFAssets.beige.color))
            AnimalCollectinView(massiveCell: [["sortImage", "Сортировка"], ["dog","Собаки"], ["cat","Кошки"], ["bird","Птицы"], ["mouse","Грызуны"], ["others","Прочее"]])
                .padding(.leading, 16)
            AdsView()
                .padding(.top, 24)
                .padding(.leading, 16)
                .padding(.trailing, 1)
            Spacer()
        }
    }
}




#Preview {
    MainView()
}
