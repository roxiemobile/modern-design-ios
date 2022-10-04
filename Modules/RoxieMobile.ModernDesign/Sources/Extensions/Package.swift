// swift-tools-version: 5.6

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "ModernDesign.Extensions",
    platforms: [
        .iOS(.v13),
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
            url: "https://github.com/roxiemobile/swift-commons-ios",
            exact: "1.6.3"
        ),
    ],
    targets: [
        .target(
            name: "ModernDesignExtensions",
            dependencies: [
                .product(name: "SwiftCommonsLang", package: "swift-commons-ios"),
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
