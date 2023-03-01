import Foundation

public struct AnyElement: HtmlProvider {
    public let html: HtmlNode

    public init(
        element: String,
        attrs: [AttrType: String] = [:],
        copy: String = "",
        @HtmlBuilder content: () -> [HtmlNode]
    ) {
        html = .element(element, attrs: attrs, copy: copy, content())
    }

    public init(element: String, attrs: [AttrType: String], copy: String, nodes: [HtmlNode]) {
        html = .element(element, attrs: attrs, copy: copy, nodes)
    }
}
