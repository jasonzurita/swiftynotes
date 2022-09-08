public enum HtmlNode {
    indirect case element(
        String,
        attrs: [(String, String)] = [],
        copy: String = "",
        [HtmlNode] = []
    )
}

public extension HtmlNode {
    var render: String {
        switch self {
        case let .element(el, attrs, copy, nested) where nested.isEmpty:
            let attributes = attrs.isEmpty ? "" : " \(attrs.map { "\($0.0)=\($0.1)" }.joined(separator: " "))"
            return """
            <\(el)\(attributes)>\(copy)</\(el)>
            """
        case let .element(el, attrs: attrs, _, nested):
            let attributes = attrs.isEmpty ? "" : " \(attrs.map { "\($0.0)=\($0.1)" }.joined(separator: " "))"
            return """
            <\(el)\(attributes)>
                 \(nested.map { $0.render }.joined(separator: "\n"))
            </\(el)>
            """
        }
    }
}
