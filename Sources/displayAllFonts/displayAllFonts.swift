// The Swift Programming Language
// https://docs.swift.org/swift-book
// Bin Hua <https://binhua.org>
import UIKit

public func displayAllFonts(hideSystemFonts: Bool) {
    // Get custom fonts from info.plist
    let customFonts = Bundle.main.object(forInfoDictionaryKey: "UIAppFonts") as? [String] ?? []
    var customFontNames = Set<String>()
    
    for font in customFonts {
        if let fontPath = Bundle.main.path(forResource: font, ofType: nil),
           let fontData = NSData(contentsOfFile: fontPath) as Data?,
           let dataProvider = CGDataProvider(data: fontData as CFData),
           let cgFont = CGFont(dataProvider),
           let postScriptName = cgFont.postScriptName as String?
        {
            customFontNames.insert(postScriptName)
        }
    }
    
    var hasDisplayedFonts = false
    
    for family in UIFont.familyNames {
        let fontNames = UIFont.fontNames(forFamilyName: family)
        let shouldPrint = !hideSystemFonts || fontNames.contains { customFontNames.contains($0) }
        
        if shouldPrint {
            print("\nFont Family: \(family)")
            for name in fontNames {
                print("- \(name)")
            }
            hasDisplayedFonts = true
        }
    }
    
    if hideSystemFonts && !hasDisplayedFonts {
        print("No custom fonts")
    }
}
