# displayAllFonts
Display all fonts on iOS

### How to use

- Import this package to your project

- Demo code

  ```
  import SwiftUI
  import displayAllFonts

  @main
  struct DemoApp: App {
      var body: some Scene {
          WindowGroup {
              ContentView()
              .onAppear {
                displayAllFonts(hideSystemFonts: false)
              }
          }
      }
  }
  ```

  **Parameters**

  hideSystemFonts:
  - true: hide the system fonts
  - false: display the system fonts

### Additions

Another way via SystemFonts Set

```
func displayAllFonts(hideSystemFonts: Bool) {
    let systemFontFamilies: Set<String> = [
        "Apple Symbols", "Academy Engraved LET", "Al Nile", "American Typewriter", "Apple Color Emoji",
        "Apple SD Gothic Neo", "Arial", "Arial Hebrew", "Arial Rounded MT Bold",
        "Avenir", "Avenir Next", "Avenir Next Condensed", "Bangla Sangam MN",
        "Baskerville", "Bodoni 72", "Bodoni 72 Oldstyle", "Bodoni 72 Smallcaps",
        "Bodoni Ornaments", "Bradley Hand", "Chalkboard SE", "Chalkduster", "Charter",
        "Cochin", "Copperplate", "Courier", "Courier New", "DIN Alternate",
        "DIN Condensed", "Damascus", "Devanagari Sangam MN", "Didot", "Diwan Mishafi",
        "Euphemia UCAS", "Farah", "Futura", "Galvji", "Geeza Pro", "Georgia", "Gill Sans", "Grantha Sangam MN",
        "Helvetica", "Helvetica Neue", "Hiragino Maru Gothic ProN", "Hiragino Mincho ProN", "Hiragino Sans",
        "Hoefler Text", "Impact", "Kailasa", "Kannada Sangam MN", "Kefa", "Khmer Sangam MN",
        "Kohinoor Bangla", "Kohinoor Devanagari", "Kohinoor Gujarati", "Kohinoor Telugu", "Lao Sangam MN",
        "Malayalam Sangam MN", "Marker Felt", "Menlo", "Mishafi", "Mukta Mahee", "Myanmar Sangam MN",
        "Noteworthy", "Noto Nastaliq Urdu", "Noto Sans Kannada", "Noto Sans Myanmar", "Noto Sans Oriya", "Optima", "Palatino", "Papyrus", "Party LET", "PingFang HK", "PingFang SC", "PingFang TC", "Rockwell",
        "Savoye LET", "Sinhala Sangam MN", "Snell Roundhand", "STIX Two Math", "STIX Two Text", "Symbol",
        "Tamil Sangam MN", "Thonburi", "Times New Roman", "Trebuchet MS",
        "Verdana", "Zapf Dingbats", "Zapfino"
    ]
    
    for family in UIFont.familyNames {
        if hideSystemFonts && systemFontFamilies.contains(family) {
            continue
        }
        
        print("\nFont Family: \(family)")
        for name in UIFont.fontNames(forFamilyName: family) {
            print("- \(name)")
        }
    }
}
```

### LICENSE

MIT, 2024-Present Bin Hua