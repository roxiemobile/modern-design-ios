// swift-tools-version:5.3

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "ModernDesign",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "ModernDesign",
            type: .static,
            targets: ["ModernDesign"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ModernDesign",
            dependencies: [
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
