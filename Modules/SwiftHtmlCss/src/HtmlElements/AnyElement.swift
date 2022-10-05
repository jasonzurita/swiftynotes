import Foundation

public struct AnyElement: HtmlProvider {
    public let html: HtmlNode

    public init(element: String, attrs: [AttrType: String] = [:], @HtmlBuilder content: () -> [HtmlNode]) {
        html = .element(element, attrs: attrs, content())
    }

    public init(element: String, attrs: [AttrType: String], nodes: [HtmlNode]) {
        html = .element(element, attrs: attrs, nodes)
    }
}
