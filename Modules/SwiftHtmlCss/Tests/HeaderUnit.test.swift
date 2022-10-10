import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class HeaderUnitTests: XCTestCase {
    private let linearGradient: Background = .linearGradient(
        .init(
            degree: 77,
            first: (.init(hex: "ASDFGH"), 4),
            second: (.init(hex: "QWERTY"), 99)
        )
    )

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

    func testHeaderWithBackground() {
        // given
        let header = Header(attrs: [:], nodes: []).background(linearGradient)

        // when
        let rendered = header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testHeaderWithMultipleStyles() {
        // given
        let header = Header(attrs: [:], nodes: [])
            .background(linearGradient)
            .padding([.trailing, .leading], 14)

        // when
        let rendered = header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
