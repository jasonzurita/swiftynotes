public struct Body: HtmlProvider {
    public let html: HtmlNode

    public init(attrs: [AttrType: String] = [:], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("body", attrs: attrs, content())
    }

    public init(attrs: [AttrType: String], nodes: [HtmlNode]) {
        html = .element("body", attrs: attrs, nodes)
    }
}

// TODO: test for this
public extension Body {
    // TODO: rename PaddingSide to be more generic now that it is being reused here
    func margin(_ sides: [PaddingSide], _ value: Double) -> Body {
        let result: Body
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs
            if Set(PaddingSide.allCases).isSubset(of: sides) {
                newAttrs[.style, default: ""] += "margin: \(value)px;"
            } else {
                for side in sides {
                    newAttrs[.style, default: ""] += "\(side.style): \(value)px;"
                }
            }

            result = Body(
                attrs: newAttrs,
                nodes: nodes
            )
        }
        return result
    }

    // Not sure why a default argument didn't work in the above function 🤷‍♂️
    func margin(_ value: Double) -> Body {
        margin(PaddingSide.allCases, value)
    }
}

// TODO: test for this
public extension Body {
    func background(_ color: Color) -> Body {
        let result: Body
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "background: #\(color.hex);"
            result = Body(
                attrs: newAttrs,
                nodes: nodes
            )
        }
        return result
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
