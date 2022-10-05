import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class ImageUnitTests: XCTestCase {
    func testBasicImg() {
        // given
        let img = Img(src: "images/logo.png")

        // when
        let rendered = img.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testImageWithMargin() {
        // given
        let img = Img(src: "images/logo.png")
            .margin(10)

        // when
        let rendered = img.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
