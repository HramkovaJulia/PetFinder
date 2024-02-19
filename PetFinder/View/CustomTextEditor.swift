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
        List {
            ZStack {
                TextEditor(text: $text)
                Text(text).opacity(0)
            }
            
        }
    }
}

#Preview {
    CustomTextEditor()
}
