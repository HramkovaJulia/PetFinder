//
//  AnimalCollectionView.swift
//  OnboardingView
//
//  Created by Алексей Шамрей on 10.02.24.
//

import SwiftUI

struct AnimalCollectinView: View {
    @State private var selectedType: String = ""
    @State var massiveCell: [[String]]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 17) {
                ForEach(massiveCell, id: \.self) { data in
                    AnimalCell(selectedType: $selectedType, imageName: data[0], labelText: data[1])
                        .cornerRadius(16)
                }
            }
        }
    }
}

struct AnimalCell: View {
    @Binding var selectedType: String
    @State var imageName: String
    @State var labelText: String
    @State var isPresented: Bool = false

    private var backgroundColor: Color {
        selectedType == imageName ? Color(PFAssets.blue.color): Color.clear
    }
    private var borderColor: Color {
        selectedType == imageName ? Color(PFAssets.white.color) : Color.clear
    }

    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: imageName)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 56, height: 56)
                .padding(.top, 8)
                .padding([.leading, .trailing], 7)
            Text(labelText)
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 12)))
                .padding(.top, 8)
                .padding(.bottom, 8)
        }
        .background(backgroundColor)
        .overlay(
              RoundedRectangle(cornerRadius: 16)
                  .stroke(borderColor, lineWidth: 5)
          )
        .sheet(isPresented: $isPresented, content: {
            SortView()
        })
        .onTapGesture {
            if imageName != "sortImage" {
                selectedType = imageName
                isPresented = false
            } else {
                selectedType = ""
                isPresented = true
            }
        }
    }
}




//#Preview {
//    AnimalCollectionView()
//}
