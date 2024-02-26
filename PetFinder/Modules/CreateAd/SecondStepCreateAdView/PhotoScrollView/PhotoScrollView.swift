//
//  PhotoScrollView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 17.02.24.
//

import SwiftUI

struct PhotoScrollView: View {
    @State var photoArray: [UIImage] = [PFAssets.clearPlus.image, PFAssets.dogBack.image, PFAssets.dogBack.image, PFAssets.dogBack.image]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 17) {
                ForEach(photoArray, id: \.self) { data in
                    PhotoCell(image: data)
                        .frame(width: 104, height: 104)
                        .cornerRadius(12)
                        .padding(.vertical, 10)
                        
                }
            }
        }
    }
}

struct PhotoCell: View {
    @State var image: UIImage
    var body: some View {
        VStack {
            if image == PFAssets.clearPlus.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .padding(34)
            } else {
                Image(uiImage: image)
                    .resizable()
                    .padding(0)
            }
        }
        .background(Color(PFAssets.white.color))
    }
}

#Preview {
    PhotoScrollView()
}
