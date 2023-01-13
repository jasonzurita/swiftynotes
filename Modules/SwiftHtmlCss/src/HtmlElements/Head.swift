import Foundation

public struct Head: HtmlProvider {
    public let html: HtmlNode

    public init(title: String, cssStyleFileName: String) {
        let titleNode: HtmlNode = .element("title", copy: title)
        // TODO: fine for now, but remove trailing "link" tag (</link>)
        let styleLinkNode: HtmlNode = .element("link", attrs: [.rel: "stylesheet", .href: cssStyleFileName], [])
        html = .element("head", attrs: [:], [titleNode, styleLinkNode])
    }
}
