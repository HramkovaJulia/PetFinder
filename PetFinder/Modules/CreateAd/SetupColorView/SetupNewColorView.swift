//
//  SetupNewColorView.swift
//  OnboardingView
//
//  Created by Алексей Шамрей on 4.02.24.
//

import SwiftUI

class ColorArray: ObservableObject {
    @Published var colors: [String]
    
    init(colors: [String]) {
        self.colors = colors
    }
}

struct SetupNewColorView: View {
    @State private var text: String = ""
    @StateObject var colorArray = ColorArray(colors: [])
    @State var countMassive = 0

    var body: some View {
        ZStack {
            NewBlurView()
                .ignoresSafeArea()
            VStack {
                NewColorTopView()
                Spacer()
                ListColorView(colorArray: $colorArray.colors)
                    .padding(.leading, 16)
                    .padding(.trailing, 15)
                    .padding(.bottom, 20)
                
                ColorTextField(text: $text, colorMassive: $colorArray.colors)
                
                SaveButton()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.06)
                    .background(Color(UIColor(hex: 0xEFBFA5)))
                    .cornerRadius(25)
            }
        }
    }
}


struct ListColorView: View {
    @Binding var colorArray: [String]
    @State var indexToDelete: Int? = nil

    var body: some View {
        VStack {
            ForEach(0..<colorArray.count / 2, id: \.self) { rowIndex in
                HStack(spacing: 16) {
                    ForEach(0..<2) { columnIndex in
                        let index = rowIndex * 2 + columnIndex
                        if index < colorArray.count {
                            ElementColorView(colorName: colorArray[index], tag: index , colorMassive: $colorArray, indexToDelete: $indexToDelete)
                            if columnIndex == 0 && index < colorArray.count - 1 {
                                Spacer()
                            }
                        }
                    }
                }
            }
            if colorArray.count % 2 != 0 {
                ElementColorView(colorName: colorArray.last!, tag: colorArray.count - 1, colorMassive: $colorArray, indexToDelete: $indexToDelete)
            }
        }
        .onChange(of: indexToDelete) { value in
            if let index = value {
                colorArray.remove(at: index)
                indexToDelete = nil
            }
        }
    }
}

struct ElementColorView: View {
    @State var colorName: String
    @State var tag: Int
    @Binding var colorMassive: [String]
    @Binding var indexToDelete: Int?

    var body: some View {
        HStack {
            Text(colorName)
            Spacer()
            Button(action: {
                print(tag)
                indexToDelete = tag
            }) {
                Image("deleteElement")
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 7)
        .background(Color(UIColor(hex: 0xFFFDFA)))
        .cornerRadius(25)
    }
}



struct ColorTextField: View {
    @Binding  var text: String
    @Binding var colorMassive: [String]
    var body: some View {
        TextField("Добавьте свой вариант окраса", text: $text)
            .padding(.leading, 5)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.06)
            .background(Color(UIColor(hex: 0xFCFCFC)))
            .cornerRadius(25)
            .overlay(
                Button(action: {
                    print(colorMassive)
                    colorMassive.append(text)
                    print(colorMassive)
                    text = ""
                }) {
                    Image("sendButton")
                        .foregroundColor(.blue)
                        .padding()
                    
                }, alignment: .trailing
            )
            .padding(.bottom, 30)
    }
}


struct SaveButton: View {
    var body: some View {
        Button(action: {
            print("123")
        }) {
            Text("Сохранить")
                .foregroundColor(.white)
                .font(.init(UIFont.sfProText(ofSize: 18, weight: .semiBold)))
        }
    }
}


struct NewColorTopView: View {
    var body: some View {
        HStack {
            Text("Вариант окраса")
                .padding(.top, 61.5)
                .padding(.leading, 16)
                .font(.init(UIFont.sfProText(ofSize: 24, weight: .semiBold)))
            Spacer()
            Button(action: {
                print("123")
            }) {
                Image("closeButton")
            }
            .padding(.top, 61.5)
            .padding(.trailing, 15)
        }
        .ignoresSafeArea()
    }
}

struct NewBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}


//#Preview {
//    SetupNewColorView(colorMassive: ["серебрянный", "золотой"])
//}
