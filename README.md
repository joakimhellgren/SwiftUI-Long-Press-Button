<h1>SwuftUI Long Press Button</h1>

<p>
    <img src="https://img.shields.io/badge/iOS-14.0+-blue.svg" />
    <img src="https://img.shields.io/badge/macOS-11.0+-orange.svg" />
    <img src="https://img.shields.io/badge/-SwiftUI-red.svg" />
</p>

LongPressButton is a lightweight and convenient Swift Package that adds a (long press) button to your (SwiftUI) macOS / iOS app. 

## Installation

1. Select File -> Add Packages...
2. Click the `+` icon on the bottom left of the Collections sidebar on the left.
3. Choose `Add Swift Package Collection` from the pop-up menu.
4. In the `Add Package Collection` dialog box, enter `https://github.com/joakimhellgren/swiftui-longpressbutton.git` as the URL and click the "Load" button.

## Usage


```swift
import LongPressButton
import SwiftUI

struct LongPressButtonView: View {
    var body: some View {
        // Example #1
        LongPressButton(action: {
            print($0)
        }, label: {
            Text("Press me")
        })
        
        // Example #2
        LongPressButton("Press me") { 
            print($0)
        }
        
        // Example #3
        LongPressButton("Press me", systemImage: "chevron.right") { 
            print($0)
        }
    }
}
```

