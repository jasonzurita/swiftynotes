import Foundation

public struct Header: HtmlProvider {
    public let html: HtmlNode

    public init(attrs: [AttrType: String] = [:], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("header", attrs: attrs, content())
    }

    public init(attrs: [AttrType: String], nodes: [HtmlNode]) {
        html = .element("header", attrs: attrs, nodes)
    }
}

// TODO: test for this
public extension Header {
    func padding(_ sides: Set<PaddingSide>, _ value: Double) -> Header {
        let result: Header
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs
            if PaddingSide.all.isSubset(of: sides) {
                newAttrs[.style, default: ""] += "padding: \(value)px;"
            } else {
                for side in sides {
                    newAttrs[.style, default: ""] += "\(side.style): \(value)px;"
                }
            }

            result = Header(
                attrs: newAttrs,
                nodes: nodes
            )
        }
        return result
    }
}
