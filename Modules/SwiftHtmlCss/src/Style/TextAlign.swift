// https://www.w3.org/TR/CSS22/text.html#x3

public extension BlockHtmlProvider {
    /// This property describes how inline-level content of a block container is aligned.
    func textAlign(_ alignment: TextAlignment) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "text-align: \(alignment.rawValue);"
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
