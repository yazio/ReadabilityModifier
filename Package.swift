// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReadabilityModifier",
    defaultLocalization: "en",
    platforms: [
        .iOS("14.0"),
    ],
    products: [
        .library(
            name: "ReadabilityModifier",
            targets: ["ReadabilityModifier"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ReadabilityModifier",
            dependencies: []),
        .testTarget(
            name: "ReadabilityModifierTests",
            dependencies: ["ReadabilityModifier"]),
    ]
)
