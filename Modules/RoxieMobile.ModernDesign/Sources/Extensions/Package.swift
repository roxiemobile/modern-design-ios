// swift-tools-version:5.3

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "ModernDesign.Extensions",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "ModernDesignExtensions",
            type: .static,
            targets: [
                "ModernDesignExtensions",
            ]
        ),
    ],
    dependencies: [
        .package(
            name: "SwiftCommons",
            url: "https://github.com/roxiemobile/swift-commons.ios",
            .upToNextMinor(from: "1.6.0")
        ),
    ],
    targets: [
        .target(
            name: "ModernDesignExtensions",
            dependencies: [
                .product(name: "SwiftCommonsLang", package: "SwiftCommons"),
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
