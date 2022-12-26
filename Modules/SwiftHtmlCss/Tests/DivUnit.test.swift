import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class DivUnitTests: XCTestCase {
    func testDivElement() {
        // given
        let div = Div {}

        // when
        let rendered = div.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testDivWithMaxWidth() {
        // given
        let div = Div {}
            .maxWidth(percent: 82)

        // when
        let rendered = div.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
