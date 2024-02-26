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
    var body: some View {
        VStack {
            SortTopView()
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
