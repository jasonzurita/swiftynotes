import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class HeadUnitTests: XCTestCase {
    func testHeadElement() {
        // given
        let head = Head(title: "test-title", cssStyleFileName: "fake.css")

        // when
        let rendered = head.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
