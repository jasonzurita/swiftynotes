import Foundation
import XCTest
@testable import SwiftHtmlCss
import SnapshotTesting

final class UnitTests: XCTestCase {
    func testEmptyBody() {
        // given
        let body = Body(attrs: [:], nodes: [])

        // when
        let rendered = body.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    // FIXME: This test exposed a bug in that the rendered form shows "padding". This needs to be fixed!
    func testBodyWithEachMargin() {
        // All cases is used here to preserve the order for the test to be deterministic
        PaddingSide.allCases.forEach {
            // given
            let body = Body(attrs: [:], nodes: []).margin([$0], 7.1)

            // when
            let rendered = body.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
        }
    }

    func testBodyWithAllMargins() {
            // given
            let body = Body(attrs: [:], nodes: []).margin(PaddingSide.allCases, 7.1)

            // when
            let rendered = body.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
    }
}
