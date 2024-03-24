//
//  KindOfAnimals.swift
//  PetFinder
//
//  Created by lelya.rumynin@gmail.com on 24.03.24.
//

import SwiftUI

struct KindOFAnimals: View {
    let animals: [KindOfAnimal] = [.dog,.cat]
    @Binding var selectedPet: KindOfAnimal
    var body: some View {
        
        VStack{
            HStack{
                Text("Вид питомца").font(PFFontFamily.SFProText.medium.swiftUIFont(size: 20))
                Spacer()
            }
            
            HStack(spacing: 16){
                ForEach(animals,id: \.self){animal in
                    KindOfAnimalCell(kindOFPet: animal, selectedAnimal: $selectedPet)
                }
            }
        }
    }
}

struct KindOfAnimalCell: View {
    let kindOFPet: KindOfAnimal
    @Binding var selectedAnimal: KindOfAnimal
    var color: Color {
        get{
            if selectedAnimal == kindOFPet {
                return PFAssets.blue.swiftUIColor
            }else {
                return Color(.white)
            }
        }
    }
    
    var image: UIImage {
        get {
            switch kindOFPet {
            case .dog:
                return PFAssets.dog.image
            case .cat:
                return PFAssets.cat.image
            default: return UIImage()
            }
        }
    }
    
    var text: String {
        get {
            switch kindOFPet {
            case .dog:
                return "Собака"
            case .cat:
                return "Кошка"
            default: return ""
            }
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            Image(uiImage: image)
                .resizable()
                .frame(width: 24,height: 24)
                .padding(.trailing,8)
            
            Text(text).font(PFFontFamily.SFProText.regular.swiftUIFont(size: 12))
            Spacer()
            
        }.frame(height: 44)
            .background(color)
            .onTapGesture {
                selectedAnimal = kindOFPet
            }
            .cornerRadius(10)
    }
}
