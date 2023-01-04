// https://www.w3.org/TR/CSS22/visudet.html#x17

public extension HtmlProvider {
    /** specifies the minimal height of line boxes within the element.
     The minimum height consists of a minimum height above the baseline and a minimum depth below it,
     exactly as if each line box starts with a zero-width inline box with the element's font and line height properties.
     **/
    func lineHeight(_ height: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            newAttrs[.style, default: ""] += "line-height: \(height);"
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
