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
            .shadow( color: Color(UIColor(hex: 0x5a5a5a, alpha: 0.06)), radius: 4, x: 2, y: 4)
        
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
        HStack(spacing: 10) {
            ForEach(0..<3, id: \.self) { index in
                SegmentSexElement(selectedTag: $selectedSegment, isSelected: index == selectedSegment, tag: index)
                    .background(self.selectedSegment == index ? backgroundColor : Color(PFAssets.white.color) )
                    .foregroundColor(self.selectedSegment == index ? Color.white : Color.black)
                    .cornerRadius(25)
                    .onTapGesture {
                        self.selectedSegment = index
                    }
                    .padding(.vertical, 8)
                    .padding(.leading, index == 0 ? 8 : 0)
                    .padding(.trailing, index == 2 ? 8 : 0)
            }
        }
//        .frame(width: UIScreen.main.bounds.width * 0.905)
        .background(Color(PFAssets.white.color))
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
            .padding(.horizontal, 42)
    }
}

#Preview {
    SexContentView()
}
