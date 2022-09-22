

public enum HtmlNode {
    indirect case element(
        String,
        attrs: [AttrType: String] = [:],
        copy: String = "",
        [HtmlNode] = []
    )
}

public extension HtmlNode {
    var render: String {
        switch self {
        case let .element(el, attrs, copy, nested) where nested.isEmpty:
            let attributes = attrs.isEmpty ? "" : " \(attrs.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " "))"
            return """
            <\(el)\(attributes)>\(copy)</\(el)>
            """
        case let .element(el, attrs: attrs, copy, nested):
            let attributes = attrs.isEmpty ? "" : " \(attrs.map { "\($0.0)=\"\($0.1)\"" }.joined(separator: " "))"
            return """
            <\(el)\(attributes)>\(copy)
                 \(nested.map(\.render).joined(separator: "\n"))
            </\(el)>
            """
        }
    }
}
