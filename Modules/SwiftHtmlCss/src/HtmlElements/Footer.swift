import Swift

public struct Footer: HtmlProvider {
    public let html: HtmlNode

    public init(attrs: [AttrType: String] = [:], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("footer", attrs: attrs, content())
    }

    public init(attrs: [AttrType: String], nodes: [HtmlNode]) {
        html = .element("footer", attrs: attrs, nodes)
    }
}

// https://www.w3.org/TR/CSS2/text.html#propdef-text-align
// TODO: have this apply to block containers like the spec says. Currently duplicated in 'Body'.
public extension Footer {
    func textAlign(_ alignment: Alignment) -> Footer {
        let result: Footer
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "text-align:\(alignment.rawValue);"
            result = Footer(
                attrs: newAttrs,
                nodes: nodes
            )
        }
        return result
    }
}
