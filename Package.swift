// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "swiftynotes",
    products: [
        .executable(name: "SwiftyNotesSite", targets: ["SwiftyNotesSite"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            from: "1.10.0"
        ),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "SwiftHtmlCss",
            dependencies: [],
            path: "Modules/SwiftHtmlCss/src"
        ),
        .testTarget(
            name: "SwiftHtmlCssTests",
            dependencies: [
                "SwiftHtmlCss",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            path: "Modules/SwiftHtmlCss/Tests",
            exclude: ["__Snapshots__"]
        ),
        .executableTarget(
            name: "SwiftyNotesSite",
            dependencies: [
                "SwiftHtmlCss",
                "Splash",
            ],
            path: "Modules/SwiftyNotesSite/src"
        ),
    ]
)
