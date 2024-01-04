// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "swiftynotes",
    products: [
        .executable(name: "SwiftyNotesSite", targets: ["SwiftyNotesSite"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jasonzurita/swift-website-dsl.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            from: "1.10.0"
        ),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftyNotesSite",
            dependencies: [
                .product(name: "SwiftWebsiteDSL", package: "swift-website-dsl"),
                "Splash",
            ],
            path: "Modules/SwiftyNotesSite/src"
        ),
    ]
)
