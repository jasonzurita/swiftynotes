import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class AnyElementTests: XCTestCase {
    func testWidthStyle() {
        // given
        let element = AnyElement(element: "fake-element", attrs: [:], copy: "", nodes: [])
            .width(789)

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testColorStyle() {
        // given
        let element = AnyElement(element: "fake-element", attrs: [:], copy: "", nodes: [])
            .color(.init(hex: "123456"))

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testAllGeneralStylesWithPElement() {
        // given
        let element = P("Super cool copy here")
            .color(.init(hex: "1234567"))
            .margin(0)
            .padding([.top], 7)
            .width(14)

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testCopyIsNotLostWithModifiers() {
        // given
        let copy = "mic test"
        let element = P(copy)
            // when
            .color(.init(hex: "1234567"))
            .margin(1)
            .padding([.top], 0)
            .width(13)

        switch element.html {
        case let .element(tag, attrs: _, copy, _):
            // then
            XCTAssertEqual(tag, "p")
            XCTAssertFalse(copy.isEmpty)
        }
    }
}
