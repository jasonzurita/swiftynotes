import Foundation

public struct Head: HtmlProvider {
    public let html: HtmlNode

    public init(title: String) {
        let titleNode: HtmlNode = .element("title", copy: title)
        html = .element("head", attrs: [:], [titleNode])
    }
}
