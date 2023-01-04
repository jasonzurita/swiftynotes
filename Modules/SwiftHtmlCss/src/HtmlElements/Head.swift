import Foundation

public struct Head: HtmlProvider {
    public let html: HtmlNode

    // TODO: pass in css files and add them to the head section
    public init(title: String) {
        let titleNode: HtmlNode = .element("title", copy: title)
        html = .element("head", attrs: [:], [titleNode])
    }
}
