![Test package](https://github.com/yazio/ReadabilityModifier/actions/workflows/ios.yml/badge.svg)

ReadabilityModifier
===============================

> UIKits readableContentGuide for every SwiftUI View, in the form of a ViewModifier

What it is
----------

Displaying multiple lines of text in a single column can make it hard to read the text and easy to lose track of the lines - especially on devices with a great screen width, like iPads.

### With the modifier applied:
![](example_images/example_with_modifier.png)

### Without the modifier:
![](example_images/example_without_modifier.png)

With iOS 9.0, Apple introduced [readableContentGuide](https://developer.apple.com/documentation/uikit/uiview/1622644-readablecontentguide) - a layout guide representing an area with a readable width within the view.

UI components that follow this layout guide automatically adjust their width accordingly to provide a better reading experience, while taking screen size, orientation, multitasking and even dynamic type size into account.

What this package does
----------------------

Since readableContentGuide is part of UIKit, there is no direct alternative in SwiftUI. Alternative solutions, like applying a bigger padding depending on the horizontal size class, do not consider the variety of combinations of screen size, dynamic type size, etc. 

ReadabilityModifier provides a simple ViewModifier that ports the original behavior of UIKits readableContentGuide to every SwiftUI View that it is applied to - either by setting the width of the view, or by adding horizontal padding.

Usage
-----

Apply .fitToReadableContentGuide() on any SwiftUI View to add horizontal padding that places the view inside the readableContentGuide
```swift
var body: some View {
    VStack {
        Text("This text could be waaaaay longer...")
            .fitToReadableContentGuide()
    }
}
```
You can add extra spacing that is added on top of the readableContentGuide
```swift
Text("This text needs some more room")
     .fitToReadableContentGuide(extraSpacing: 20)
```
The default way the readableContentGuide is respected is by adding a horizontal padding to the view. In some cases, e.g. when the view is already placed in a VStack that already has padding, this padding will add up and make the text smaller than intended. By changing the type property, you can also set the width of the view - this uses the .frame() function to respect the readableContentGuide
```swift
VStack {
    Text("This text is already in a padded container, so I will rather set its width")
        .fitToReadableContentGuide(type: .width)
}
.padding(100)
```

Install
-------

### Adding ReadabilityModifier as a package dependency

1. Go to `Xcode` -> `Project Settings` and select your Project
2. Select Tab `Package Dependencies` and click the +
3. Paste `https://github.com/yazio/ReadabilityModifier` in the search bar and click on "Add Package"
4. Select the target(s) in which you want to use ReadabilityModifier

### Swift Package Manager

Add ReadabilityModifier as a package dependency, like shown in the example below:
```swift
// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "YourProject",
  platforms: [
       .iOS(.v14),
  ],
  dependencies: [
    .package(name: "ReadabilityModifier", url: "https://github.com/yazio/ReadabilityModifier.git", .branch("main"))
  ],
  targets: [
    .target(name: "YourProject", dependencies: ["ReadabilityModifier"])
  ]
)
```

We are hiring
-------------

If you are interested in working on a well architected Nutrition & Health-App in a fully remote position, we'd love to hear from you! [Check our open positions](https://www.yazio.com/en/jobs) and feel free to reach out if you have any questions.
