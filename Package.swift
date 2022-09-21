// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "swiftynotes",
    products: [
        .executable(name: "SwiftyNotesSite", targets: ["SwiftyNotesSite"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftHtmlCss",
            dependencies: [],
            path: "Modules/SwiftHtmlCss/src"
        ),
        .executableTarget(
            name: "SwiftyNotesSite",
            dependencies: [
                "SwiftHtmlCss",
            ],
            path: "Modules/SwiftyNotesSite/src"
        ),
    ]
)
