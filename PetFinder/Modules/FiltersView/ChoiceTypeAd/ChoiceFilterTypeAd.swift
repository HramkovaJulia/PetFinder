//
//  ChoiceTypeAd.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 14.02.24.
//

import SwiftUI

import SwiftUI

struct ChoiceFilterTypeAd: View {
    
    let statusOfPosts: [StatusOfPost] = [.lost,.found,.lookingForAHome]
    @Binding var currentStatus: StatusOfPost 
    
    var body: some View {
        
        HStack(spacing: 14){
            
            ForEach(statusOfPosts,id: \.self){ status in
                
                ChoiceFilterTypeAdCell(statusOfPost: status, currentStatus: $currentStatus)
                    
            }
        }
    }
}

struct ChoiceFilterTypeAdCell: View {
    @State var statusOfPost: StatusOfPost
    @Binding var currentStatus: StatusOfPost
    
    var bgColor: Color {
        get {
             currentStatus == statusOfPost ? PFAssets.blue.swiftUIColor : PFAssets.white.swiftUIColor
        }
    }
    
    var image: UIImage {
        get{
            switch statusOfPost {
            case .found:
                return PFAssets.foundPet.image
            case .lost:
                return PFAssets.lostImage.image
            case .lookingForAHome:
                return PFAssets.findingPet.image
            default: return UIImage()
            }
        }
    }
    
    var text: String {
        get{
            switch image {
            case PFAssets.foundPet.image : return "Найден"
            case PFAssets.lostImage.image : return "Пропал"
            case PFAssets.findingPet.image : return "Ищет Дом"
            default:
                return ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .padding(.bottom,6)
            Text(text).font(PFFontFamily.SFProText.regular.swiftUIFont(size: 14))
        }.frame(width: 105,height: 67)
            
            .onTapGesture {
                currentStatus = statusOfPost
            }
            .background(bgColor)
            .cornerRadius(12)
    }
}

//struct ChoiceFilterTypeAd: View {
//    @State var selectedSegment: Int? = nil
//    @State private var typeArray = [["Пропал", PFAssets.lostImage.image], ["Найден", PFAssets.foundPet.image], ["Ищет дом", PFAssets.findingPet.image]]
//    var body: some View {
//        HStack(spacing: 14) {
//            ForEach(0..<typeArray.count, id: \.self) { type in
//                FilterTypeAd(imageName: typeArray[type][1] as! UIImage, label: typeArray[type][0] as! String, tag: type, selectedTag: $selectedSegment)
//                    .background(Color(PFAssets.white.color))
//                    .cornerRadius(12)
//                    .onTapGesture {
//                        self.selectedSegment = type
//                    }
//            }
//       
//        }
//    }
//}
//
//struct FilterTypeAd: View {
//    @State var imageName: UIImage
//    @State var label: String
//    @State var tag: Int
//    @Binding var selectedTag: Int?
//    var body: some View {
//        VStack {
//            Image(uiImage: imageName)
//                .padding(.top, 10)
//                .padding(.horizontal, 40.5)
//      
//            Text(label)
//                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
//                .foregroundColor(tag == selectedTag ? Color(PFAssets.black.color) : Color(PFAssets.darkGray.color) )
//                .padding(.bottom, 10)
//        }
//        .background(tag == selectedTag ? Color(PFAssets.blue.color) : .clear)
//    }
//}


//#Preview {
//    ChoiceFilterTypeAd()
//}
