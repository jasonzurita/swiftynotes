import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class AnyElementTests: XCTestCase {
    func testWidthStyle() {
        // given
        let element = AnyElement(element: "fake-element", attrs: [:], nodes: [])
            .width(789)

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
