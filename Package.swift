// swift-tools-version:5.2
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
    .target(
      name: "SwiftyNotesSite",
      dependencies: [
        "SwiftHtmlCss",
      ],
      path: "Modules/SwiftyNotesSite/src"
    ),
  ]
)
