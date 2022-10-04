// swift-tools-version: 5.6

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "ModernDesign",
    platforms: [
        .iOS(.v13),
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
            url: "https://github.com/roxiemobile/swift-commons-ios",
            exact: "1.7.0"
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
                .product(name: "SwiftCommonsLang", package: "swift-commons-ios"),
            ],
            path: "Modules/RoxieMobile.ModernDesign/Sources/Extensions/Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
