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

    func testBodyWithEachMargin() {
        Side.allCases.forEach {
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
            let body = Body(attrs: [:], nodes: []).margin(Side.allCases, 7.1)

            // when
            let rendered = body.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
    }

    func testBodyWithBackground() {
        // given
        let body = Body(attrs: [:], nodes: []).background(.init(hex: "ASDFGH"))

        // when
        let rendered = body.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testBodyWithFont() {
        // given
        let body = Body(attrs: [:], nodes: []).font(.apple)

        // when
        let rendered = body.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testBodyWithMultipleStyles() {
        // given
        let body = Body(attrs: [:], nodes: [])
            .font(.apple)
            .background(.init(hex: "ASDFGH"))
            .margin(11)

        // when
        let rendered = body.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
