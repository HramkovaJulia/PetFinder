//
//  SortView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 10.02.24.
//

import SwiftUI

struct SortView: View {
    @State var massive: [[String]] = [["По удаленности", "Объявления ближе к указанной точке геолокации"], ["По дате публикации", "Самые свежие объявления"]]
    @State var selectedCell: Int? = nil
    var dismiss: (() -> Void)
    var body: some View {
        VStack {
            SortTopView(dismiss: dismiss)
            Divider()
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 20)
            VStack(spacing: 16) {
                ForEach(0..<massive.count, id: \.self) { index in
                    TypeSortButton(mainText: massive[index][0], descriptionText: massive[index][1], isSelected: selectedCell == index)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(16)
                        .tag(index)
                        .onTapGesture {
                            selectedCell = index
                        }
                }
            }
            .padding([.leading, .trailing], 16)
            Spacer()
        }
        .background(Color(PFAssets.background.color))
    }
}

struct SortTopView: View {
    var dismiss: (() -> Void)
    var body: some View {
        HStack {
            Text("Сортировка")
                .font(.init(PFFontFamily.SFProText.semibold.font(size: 24)))
                .padding(.leading, 16)
                .padding(.top, 24)
            Spacer()
            Button(action: {
                dismiss()
            }) {
                Image(uiImage: PFAssets.sortClose.image)
            }
            .padding(.trailing, 16)
            .padding(.top, 29)
        }
    }
}

struct TypeSortButton: View {
    let mainText: String
    let descriptionText: String
    let isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(mainText)
                    .frame(alignment: .leading)
                    .padding(.leading, 16)
                    .font(.init(PFFontFamily.SFProText.medium.font(size: 16)))
                    .padding(.top, 14)
                Text(descriptionText)
                    .font(.init(PFFontFamily.SFProText.regular.font(size: 12)))
                    .padding(.top, 4)
                    .padding(.leading, 16)
                    .padding(.bottom, 14)
            }
            Spacer()
            if isSelected {
                Button(action: {
                    
                }) {
                    
                    Image(uiImage: PFAssets.selectedSortButton.image)
                }
                .padding(.top, 24)
                .padding(.bottom, 27)
                .padding(.trailing, 16)
            }
  
        }
        .frame(maxWidth: .infinity)
        
    }
}
