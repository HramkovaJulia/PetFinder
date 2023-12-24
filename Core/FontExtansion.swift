//
//  FontExtansion.swift
//  PetFinder
//
//  Created by Julia on 17.10.2023.
//

import UIKit

extension UIFont {
    enum SFProText: String {
        case regular = "SFProText-Regular"
        case bold = "SFProText-Bold"
        case semiBold = "SFProText-Semibold"
        case medium = "SFProText-Medium"
        case light = "SFProText-Light"
    }
    
    class func sfProText(ofSize fontSize: CGFloat, weight: SFProText) -> UIFont {
        return UIFont(name: weight.rawValue, size: fontSize) ?? systemFont(ofSize: fontSize)
    }
}
