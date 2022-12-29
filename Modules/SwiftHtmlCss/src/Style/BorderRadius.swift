public extension HtmlProvider {
    /// Adds a border radius in px to all corners
    func borderRadius(px: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "border-radius: \(px)px;"
            result = AnyElement(
                element: element,
                attrs: newAttrs,
                copy: copy,
                nodes: nodes
            )
        }
        return result
    }
}
