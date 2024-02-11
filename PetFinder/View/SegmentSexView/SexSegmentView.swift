//
//  SexSegmentView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 11.02.24.
//

import SwiftUI

struct SexContentView: View {
    
    var body: some View {
        SexSegmentView()
    }
}

struct SexSegmentView: View {
     @State var selectedSegment: Int = 0
    
    var backgroundColor: Color {
        switch selectedSegment {
        case 0:
            Color(uiColor: PFAssets.blue.color)
        case 1:
            Color(UIColor(hex: 0xFFF2FE))
        default:
            Color(uiColor: PFAssets.beige.color)
        }
    }
    var body: some View {
        HStack {
            ForEach(0..<3, id: \.self) { index in
                SegmentSexElement(selectedTag: $selectedSegment, isSelected: index == selectedSegment, tag: index)
                    .padding(8)
                    .background(self.selectedSegment == index ? backgroundColor : Color(PFAssets.white.color) )
                    .foregroundColor(self.selectedSegment == index ? Color.white : Color.black)
                    .cornerRadius(25)
                    .onTapGesture {
                        self.selectedSegment = index
                    }
            }
        }
        .padding(8)
        .background(Color(uiColor: PFAssets.white.color))
        .cornerRadius(25)
    }
}

struct SegmentSexElement: View {
    @Binding var selectedTag: Int
    @State var isSelected: Bool
    @State var tag: Int
    
    private var image: UIImage {
        switch tag {
        case 0:
            PFAssets.menSex.image
        case 1:
            PFAssets.womenSex.image
        default:
            PFAssets.otherSex.image
        }
    }

    var body: some View {
        Image(uiImage: image)
            .renderingMode(selectedTag == tag ? .original : .template)
            .foregroundColor(selectedTag == tag ? .primary : Color(uiColor: UIColor(hex: 0xa6a6a6)))
            .padding(.vertical, 8)
            .padding(.horizontal, 41.3)
    }
}

#Preview {
    SexContentView()
}
