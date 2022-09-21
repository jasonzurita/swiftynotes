public struct Body: HtmlProvider {
    public let html: HtmlNode

    public init(attrs: [(String, String)] = [], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("body", attrs: attrs, content())
    }

    public init(attrs: [(String, String)], nodes: [HtmlNode]) {
        html = .element("body", attrs: attrs, nodes)
    }
}

// TODO: test for this
public extension Body {
    func background(_ color: Color) -> Body {
        let result: Body
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            result = Body(
                attrs: attrs + [("style", "\"background: #\(color.hex);\"")],
                nodes: nodes
            )
        }
        return result
    }
}
