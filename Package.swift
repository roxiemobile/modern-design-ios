// swift-tools-version:5.5

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

        .library(
            name: "ModernDesignExtensions",
            type: .static,
            targets: ["ModernDesignExtensions"]
        ),
    ],
    dependencies: [
        .package(
            name: "SwiftCommons",
            url: "https://github.com/roxiemobile/swift-commons.ios",
            .upToNextMinor(from: "1.6.3")
        ),
    ],
    targets: [
        .target(
            name: "ModernDesign",
            dependencies: [
                .target(name: "ModernDesignExtensions"),
            ]
        ),

        .target(
            name: "ModernDesignExtensions",
            dependencies: [
                .product(name: "SwiftCommonsLang", package: "SwiftCommons"),
            ],
            path: "Modules/RoxieMobile.ModernDesign/Sources/Extensions/Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
