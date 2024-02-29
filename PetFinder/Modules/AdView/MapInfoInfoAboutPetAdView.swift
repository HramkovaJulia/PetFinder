//
//  MapInfoInfoAboutPetAdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 18.02.24.
//

import SwiftUI
import MapKit

struct MapInfoInfoAboutPetAdView: View {
    @State var model: MapInfoInfoAboutPetAdModel
    
    var body: some View {
        VStack(spacing: 14) {
            Text(model.missingAddress)
                .font(.init(PFFontFamily.SFProText.semibold.swiftUIFont(size: 18)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 14)
            PossitionButtonsMapInfoInfoAboutPetAdView(model: model.possitionButtonsMapInfoInfoAboutPetAdModel)
                .padding(.horizontal, 14)
            StackMapViewInfoInfoAboutPetAdView(model: model.stackMapViewInfoInfoAboutPetAdModel)
                .padding(.horizontal,14)
                .padding(.bottom, 14)
            
            
        }
    }
}

struct PossitionButtonsMapInfoInfoAboutPetAdView: View {
    @State var model: PossitionButtonsMapInfoInfoAboutPetAdModel
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(uiImage: PFAssets.mapPoint.image)
                Text("Малинина, 30")
                    .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                    .foregroundColor(Color(PFAssets.black.color))
                    .underline()
            }
            Spacer()
            Text("1,4 км от вас")
                .font(.init(PFFontFamily.SFProText.regular.swiftUIFont(size: 14)))
                .foregroundColor(Color(PFAssets.red.color))
        }
    }
}

struct StackMapViewInfoInfoAboutPetAdView: View {
    
    @State var model: StackMapViewInfoInfoAboutPetAdModel
    
    var body: some View {
        ZStack {
            MapViewInfoInfoAboutPetAdView()
                .frame( height: 138)
                .cornerRadius(12)
            HStack {
                Spacer()
                VStack(spacing: 4) {
                    ButtonMapInfoInfoAboutPetAdView(image: PFAssets.bigMapButton.image)
                        .background(Color(PFAssets.darkGray.color))
                        .cornerRadius(50)
                    Spacer()
                    ButtonMapInfoInfoAboutPetAdView(image: PFAssets.zoomPlus.image)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(50)
                    ButtonMapInfoInfoAboutPetAdView(image: PFAssets.zoomMinus.image)
                        .background(Color(PFAssets.white.color))
                        .cornerRadius(50)
                }
                .padding(.vertical, 8)
            }
            
        }
    }
}

struct ButtonMapInfoInfoAboutPetAdView: View {
    @State var image: UIImage
    var body: some View {
        Button(action: {
            
        }) {
            if image == PFAssets.zoomMinus.image {
                Image(uiImage: image)
                    .padding(.horizontal, 9)
                    .padding(.top, 17)
                    .padding(.bottom, 15)
            } else {
                Image(uiImage: image)
                    .padding(9)
            }
            
        }
    }
}



struct MapViewInfoInfoAboutPetAdView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
}

//#Preview {
//    MapInfoInfoAboutPetAdView()
//}
