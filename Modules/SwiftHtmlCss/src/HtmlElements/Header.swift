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

// TODO: combine with other background in "body"
public extension Header {
    func background(_ background: Background) -> Header {
        let result: Header
        switch html {
        case let .element(_, attrs: attrs, _, nodes):
            var newAttrs = attrs

            switch background {
            case let .linearGradient(lg):
                newAttrs[.style, default: ""] +=
                    """
                    background: linear-gradient(\
                    \(lg.degree)deg,\
                    #\(lg.first.0.hex) \(lg.first.1)%,\
                    #\(lg.second.0.hex) \(lg.second.1)%\
                    );
                    """
                result = Header(
                    attrs: newAttrs,
                    nodes: nodes
                )
            }
        }
        return result
    }
}
