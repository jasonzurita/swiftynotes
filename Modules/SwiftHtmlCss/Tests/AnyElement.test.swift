import Foundation
import SnapshotTesting
@testable import SwiftHtmlCss
import XCTest

final class AnyElementTests: XCTestCase {
    // MARK: - Styles

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

    func testMarginAutoStyle() {
        // given
        let element = AnyElement(element: "fake-margin-auto-element", attrs: [:], copy: "", nodes: [])
            .margin([.leading, .top], .auto)

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testBackgroundColor() {
        // given
        let element = AnyElement(element: "fake-background-color-element", attrs: [:], copy: "", nodes: [])
            .background(.color(.init(hex: "123456")))

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testBackgroundLinearGradient() {
        // given
        let gradient: BackgroundType.LinearGradient = .init(
            degree: 77,
            first: (.init(hex: "ASDFGH"), 4),
            second: (.init(hex: "QWERTY"), 99)
        )

        let element = AnyElement(element: "fake-background-linear-gradient-element", attrs: [:], copy: "", nodes: [])
            .background(.linearGradient(gradient))

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testBorderRadius() {
        // given
        let element = AnyElement(element: "fake-border-radius-element", attrs: [:], copy: "", nodes: [])
            .borderRadius(px: 16)

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testLineHeight() {
        // given
        let element = AnyElement(element: "fake-line-height-element", attrs: [:], copy: "", nodes: [])
            .lineHeight(2.3)

        // when
        let rendered = element.html.render

        // then
        assertSnapshot(matching: rendered, as: .lines)
    }

    func testMostGeneralStylesWithPElement() {
        // given
        let element = P("Super cool copy here")
            .color(.init(hex: "1234567"))
            .margin(0)
            .padding([.top], 7)
//            .width(13) // TODO: this fails because width for a p element should be in the style section

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

        switch element.html {
        case let .element(tag, attrs: _, copy, _):
            // then
            XCTAssertEqual(tag, "p")
            XCTAssertFalse(copy.isEmpty)
        }
    }
}
