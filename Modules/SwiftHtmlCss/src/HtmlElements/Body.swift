public struct Body: BlockHtmlProvider {
    public let html: HtmlNode

    public init(attrs: [AttrType: String] = [:], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("body", attrs: attrs, content())
    }

    public init(attrs: [AttrType: String], nodes: [HtmlNode]) {
        html = .element("body", attrs: attrs, nodes)
    }
}

public extension Body {
    func font(_ font: Font) -> Body {
        let result: Body
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "\(font.style);"
            result = Body(
                attrs: newAttrs,
                nodes: nodes
            )
        }
        return result
    }
}
