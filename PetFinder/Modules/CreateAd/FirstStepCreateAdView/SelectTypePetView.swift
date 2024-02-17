//
//  SelectTypePetView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct SelectTypePetView: View {
    var body: some View {
        VStack {
            Text("Вид питомца")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 20)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
            AnimalCollectinView(showSortView: {
            }, massiveCell: [ ["dog","Собаки"], ["cat","Кошки"], ["bird","Птицы"], ["mouse","Грызуны"], ["others","Прочее"]])
        }
    }
}

#Preview {
    SelectTypePetView()
}
