// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum PFAssets {
  public static let background = ColorAsset(name: "Background")
  public static let beige = ColorAsset(name: "Beige")
  public static let black = ColorAsset(name: "Black")
  public static let blue = ColorAsset(name: "Blue")
  public static let darkBeige = ColorAsset(name: "DarkBeige")
  public static let darkBlue = ColorAsset(name: "DarkBlue")
  public static let darkGray = ColorAsset(name: "DarkGray")
  public static let deepBlue = ColorAsset(name: "DeepBlue")
  public static let ginger = ColorAsset(name: "Ginger")
  public static let lightGray = ColorAsset(name: "LightGray")
  public static let red = ColorAsset(name: "Red")
  public static let white = ColorAsset(name: "White")
  public static let bell = ImageAsset(name: "Bell")
  public static let heart = ImageAsset(name: "Heart")
  public static let adsStar = ImageAsset(name: "adsStar")
  public static let adsStarFull = ImageAsset(name: "adsStarFull")
  public static let allScreen = ImageAsset(name: "allScreen")
  public static let apple = ImageAsset(name: "apple")
  public static let backButton = ImageAsset(name: "backButton")
  public static let backspaceButton = ImageAsset(name: "backspaceButton")
  public static let bird = ImageAsset(name: "bird")
  public static let cancel = ImageAsset(name: "cancel")
  public static let cat = ImageAsset(name: "cat")
  public static let clearPlus = ImageAsset(name: "clearPlus")
  public static let clipboard = ImageAsset(name: "clipboard")
  public static let closeButton = ImageAsset(name: "closeButton")
  public static let closedButton = ImageAsset(name: "closedButton")
  public static let createAd = ImageAsset(name: "createAd")
  public static let dog = ImageAsset(name: "dog")
  public static let dogBack = ImageAsset(name: "dog_back")
  public static let dropdownButton = ImageAsset(name: "dropdownButton")
  public static let exitProfile = ImageAsset(name: "exitProfile")
  public static let favoriteButton = ImageAsset(name: "favoriteButton")
  public static let findingPet = ImageAsset(name: "findingPet")
  public static let firstImage = ImageAsset(name: "firstImage")
  public static let fosterButton = ImageAsset(name: "fosterButton")
  public static let foundPet = ImageAsset(name: "foundPet")
  public static let foundPetButton = ImageAsset(name: "foundPetButton")
  public static let fourImage = ImageAsset(name: "fourImage")
  public static let getPetButton = ImageAsset(name: "getPetButton")
  public static let google = ImageAsset(name: "google")
  public static let hide = ImageAsset(name: "hide")
  public static let list = ImageAsset(name: "list")
  public static let lostPetButton = ImageAsset(name: "lostPetButton")
  public static let lostImage = ImageAsset(name: "lost_image")
  public static let mapPoint = ImageAsset(name: "mapPoint")
  public static let menSex = ImageAsset(name: "menSex")
  public static let mouse = ImageAsset(name: "mouse")
  public static let notificationProfile = ImageAsset(name: "notificationProfile")
  public static let otherSex = ImageAsset(name: "otherSex")
  public static let others = ImageAsset(name: "others")
  public static let plusButton = ImageAsset(name: "plusButton")
  public static let profile = ImageAsset(name: "profile")
  public static let radioDeselect = ImageAsset(name: "radioDeselect")
  public static let radioSelect = ImageAsset(name: "radioSelect")
  public static let secondBackButton = ImageAsset(name: "secondBackButton")
  public static let secondImage = ImageAsset(name: "secondImage")
  public static let selectedSortButton = ImageAsset(name: "selectedSortButton")
  public static let services = ImageAsset(name: "services")
  public static let settingsProfile = ImageAsset(name: "settingsProfile")
  public static let show = ImageAsset(name: "show")
  public static let sortClose = ImageAsset(name: "sortClose")
  public static let sortImage = ImageAsset(name: "sortImage")
  public static let star = ImageAsset(name: "star")
  public static let thirdImage = ImageAsset(name: "thirdImage")
  public static let userImage = ImageAsset(name: "userImage")
  public static let womenSex = ImageAsset(name: "womenSex")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
