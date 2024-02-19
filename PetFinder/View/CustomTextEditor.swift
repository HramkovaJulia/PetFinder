//
//  CustomTextEditor.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 19.02.24.
//

import SwiftUI

struct CustomTextEditor: View {
    @State private var text: String = ""
    var body: some View {
        TextEditor(text: $text)
            .padding(5)
            .background(Color.white)
            .frame(minHeight: 53)
            .fixedSize(horizontal: false, vertical: true)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(!text.isEmpty ? PFAssets.blue.color : .clear), lineWidth: 2)
            )
           
    }
}


#Preview {
    CustomTextEditor()
}
