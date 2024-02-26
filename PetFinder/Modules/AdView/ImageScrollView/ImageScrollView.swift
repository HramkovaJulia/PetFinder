//
//  ImageScrollView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct ImageScrollView: View {
    @State private var currentTab = 0
    @State var images: [UIImage]
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            ForEach(0 ..< images.count, id: \.self){ index in
                Image(uiImage: images[index])
                    .resizable()
                    .tag(index)
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}

#Preview {
    ImageScrollView(images: [
        PFAssets.dogBack.image,
        PFAssets.dogBack.image,
        PFAssets.dogBack.image
    ])
}

//enum ImageScrollViewModel {
//    let images: [UIImage]
//}
