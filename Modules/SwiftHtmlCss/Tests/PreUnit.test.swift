import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class PreUnitTests: XCTestCase {
    func testPreElement() {
        // given
        let pre = Pre {}

        // when
        let rendered = pre.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testPreWithNestedElementToEnsureSingleLineHtml() {
        // given
        let pre = Pre {
            Div {
                P("ooo, nested twice")
            }
        }

        // when
        let rendered = pre.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
