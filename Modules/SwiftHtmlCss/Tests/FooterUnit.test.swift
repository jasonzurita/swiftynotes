import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class FooterUnitTests: XCTestCase {
    func testFooterElement() {
        // given
        let footer = Footer {}

        // when
        let rendered = footer.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testFooterEnclosingPElement() {
        // given
        let footer = Footer {
            P("Hi footer")
        }

        // when
        let rendered = footer.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testFooterEnclosingPWithStyleElement() {
        // given
        let footer = Footer {
            P("Hi footer")
        }
        .color(.init(hex: "123456"))

        // when
        let rendered = footer.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
