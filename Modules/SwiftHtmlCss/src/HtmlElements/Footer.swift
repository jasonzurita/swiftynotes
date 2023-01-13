import Swift

public struct Footer: BlockHtmlProvider {
    public let html: HtmlNode

    public init(attrs: [AttrType: String] = [:], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("footer", attrs: attrs, content())
    }

    public init(attrs: [AttrType: String], nodes: [HtmlNode]) {
        html = .element("footer", attrs: attrs, nodes)
    }
}
