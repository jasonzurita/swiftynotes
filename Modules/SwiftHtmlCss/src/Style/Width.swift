// May need to be updated later to apply to select elements because
// of the below spec note: https://www.w3.org/TR/CSS22/visudet.html#the-width-property
// Applies to: all elements but non-replaced inline elements, table rows, and row groups

// TODO: figure out putting the width separately or in the 'style' list
public extension HtmlProvider {
    /// Specifies the width of the content area using a length unit.
    func width(_ length: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            newAttrs[.width] = "\(length)px;"
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
