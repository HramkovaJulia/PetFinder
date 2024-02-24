//
//  ImageScrollView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI

struct ImageScrollView: View {
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            Image(uiImage: PFAssets.dogBack.image)
                .resizable()
                .tag(0)
            Image(uiImage: PFAssets.dogBack.image)
                .resizable()
                .tag(1)
            Image(uiImage: PFAssets.dogBack.image)
                .resizable()
                .tag(2)
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}

#Preview {
    ImageScrollView()
}
