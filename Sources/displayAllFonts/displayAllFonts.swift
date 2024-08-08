// The Swift Programming Language
// https://docs.swift.org/swift-book
// Bin Hua <https://binhua.org>
import UIKit

public func displayAllFonts(hideSystemFonts: Bool) {
    // get custom fonts from info.plist
    guard let customFonts = Bundle.main.object(forInfoDictionaryKey: "UIAppFonts") as? [String] else {
        print("No custom fonts")
        return
    }

    var customFontNames = Set<String>()

    for font in customFonts {
        // Get fullPath
        if let fontPath = Bundle.main.path(forResource: font, ofType: nil),
           let fontData = NSData(contentsOfFile: fontPath) as Data?,
           let dataProvider = CGDataProvider(data: fontData as CFData),
           let cgFont = CGFont(dataProvider),
           let postScriptName = cgFont.postScriptName as String?
        {
            customFontNames.insert(postScriptName)
        }
    }

    for family in UIFont.familyNames {
        var shouldPrint = true

        if hideSystemFonts {
            let fontNames = UIFont.fontNames(forFamilyName: family)
            // Check: all system fonts
            shouldPrint = fontNames.contains { customFontNames.contains($0) }
        }

        if shouldPrint {
            print("\nFont Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("- \(name)")
            }
        }
    }
}
