import Foundation
import XCTest
@testable import SwiftHtmlCss
import SnapshotTesting

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
        let Header = Header(attrs: [:], nodes: [])

        // when
        let rendered = Header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testHeaderWithEachPadding() {
        Side.allCases.forEach {
            // given
            let Header = Header(attrs: [:], nodes: []).padding([$0], 7.6)

            // when
            let rendered = Header.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
        }
    }

    func testHeaderWithAllPaddings() {
            // given
            let Header = Header(attrs: [:], nodes: []).padding(Side.allCases, 7.1)

            // when
            let rendered = Header.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
    }

    func testHeaderWithBackground() {
        // given
        let Header = Header(attrs: [:], nodes: []).background(linearGradient)

        // when
        let rendered = Header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testHeaderWithMultipleStyles() {
        // given
        let Header = Header(attrs: [:], nodes: [])
            .background(linearGradient)
            .padding([.trailing, .leading], 14)

        // when
        let rendered = Header.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
