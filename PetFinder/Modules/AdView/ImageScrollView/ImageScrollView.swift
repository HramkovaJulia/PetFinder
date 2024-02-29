//
//  ImageScrollView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct ImageScrollView: View {
    
    @State var model: ImageScrollModel
    
    @State private var currentTab = 0
    
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            ForEach(0 ..< model.images.count, id: \.self){ index in
                Image(uiImage: model.images[index])
                    .resizable()
                    .tag(index)
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}

//#Preview {
//    ImageScrollView(images: [
//        PFAssets.dogBack.image,
//        PFAssets.dogBack.image,
//        PFAssets.dogBack.image
//    ])
//}


