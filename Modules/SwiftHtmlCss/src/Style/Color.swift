// https://www.w3.org/TR/CSS2/colors.html#q14.0
public extension HtmlProvider {
    /// This property describes the foreground color of an element's text content.
    func color(_ color: Color) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "color: #\(color.hex);"
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
