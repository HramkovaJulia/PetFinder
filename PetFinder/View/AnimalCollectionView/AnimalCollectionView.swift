//
//  AnimalCollectionView.swift
//  OnboardingView
//
//  Created by Алексей Шамрей on 10.02.24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedType: String = ""
    @State private var massiveCell: [[String]] = [["sortImage", "Сортировка"], ["dog","Собаки"], ["cat","Кошки"], ["bird","Птицы"], ["mouse","Грызуны"], ["others","Прочее"]]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 17) {
                ForEach(massiveCell, id: \.self) { data in
                    AnimalCell(selectedType: $selectedType, imageName: data[0], labelText: data[1])
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal, 17)
        }
    }
}

struct AnimalCell: View {
    @Binding var selectedType: String
    @State var imageName: String
    @State var labelText: String

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
        .onTapGesture {
            if imageName != "sortImage" {
                selectedType = imageName
            } else {
                selectedType = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//#Preview {
//    AnimalCollectionView()
//}
