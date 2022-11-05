import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class FooterUnitTests: XCTestCase {
    func testEmptyBody() {
        // given
        let footer = Footer(attrs: [:], nodes: [])

        // when
        let rendered = footer.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testFooterWithTextAlignment() {
        Alignment.allCases.forEach {
            // given
            let footer = Footer(attrs: [:], nodes: []).textAlign($0)

            // when
            let rendered = footer.html.render

            // then
            assertSnapshot(matching: rendered, as: .lines)
        }
    }

    func testFooterWithMultipleStyles() {
        // given
        let footer = Footer(attrs: [:], nodes: [])
            .textAlign(.center)
            .color(.init(hex: "ASDFGH"))

        // when
        let rendered = footer.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
