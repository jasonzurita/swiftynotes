import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class HeaderUnitTests: XCTestCase {
    func testEmptyHeader() {
        // given
        let header = Header(attrs: [:], nodes: [])

        // when
        let rendered = header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testHeaderWithEachPadding() {
        Side.allCases.forEach {
            // given
            let header = Header(attrs: [:], nodes: []).padding([$0], 7.6)

            // when
            let rendered = header.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
        }
    }

    func testHeaderWithAllPaddings() {
        // given
        let header = Header(attrs: [:], nodes: []).padding(Side.allCases, 7.1)

        // when
        let rendered = header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
