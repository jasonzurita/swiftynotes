import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class CodeUnitTests: XCTestCase {
    func testCodeElement() {
        // given
        let code = Code {}

        // when
        let rendered = code.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testCodeWithNestedElementToEnsureSingleLineHtml() {
        // given
        let code = Code {
            P("let hello = world!")
        }

        // when
        let rendered = code.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }
}
