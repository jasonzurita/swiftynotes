public struct Body: HtmlProvider {
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

// https://www.w3.org/TR/CSS2/text.html#propdef-text-align
// TODO: update this to apply to "Applies to:  block containers"
public extension Body {
    func textAlign(_ alignment: Alignment) -> Body {
        let result: Body
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "text-align:\(alignment.rawValue);"
            result = Body(
                attrs: newAttrs,
                nodes: nodes
            )
        }
        return result
    }
}
