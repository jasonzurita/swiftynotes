// May need to be updated later to apply to select elements because
// of the below spec note: https://www.w3.org/TR/CSS22/visudet.html#propdef-max-width
// Applies to: all elements but non-replaced inline elements, table rows, and row groups

public extension HtmlProvider {
    /// Specifies the max width of the content area using a length unit.
    func maxWidth(percent: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "max-width: \(percent)%;"
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
