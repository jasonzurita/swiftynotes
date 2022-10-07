import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class ImageUnitTests: XCTestCase {
    func testBasicImg() {
        // given
        let img = Img(src: "images/logo.png", alt: "alt required string")

        // when
        let rendered = img.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testImageWithMargin() {
        // given
        let img = Img(src: "images/logo.png", alt: "alt required string")
            .margin(10)

        // when
        let rendered = img.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
