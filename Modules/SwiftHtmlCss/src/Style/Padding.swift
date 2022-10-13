// May need to be updated later to apply to select elements because
// of the below spec note: https://www.w3.org/TR/CSS2/box.html#padding-properties
// Applies to: all elements except table-row-group, table-header-group, table-footer-group, table-row, table-column-group and table-column

public extension HtmlProvider {
    func padding(_ sides: [Side], _ value: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            if Set(Side.allCases).isSubset(of: sides) {
                newAttrs[.style, default: ""] += "padding: \(value)px;"
            } else {
                for side in sides {
                    newAttrs[.style, default: ""] += "\(side.padding): \(value)px;"
                }
            }

            result = AnyElement(
                element: element,
                attrs: newAttrs,
                copy: copy,
                nodes: nodes
            )
        }
        return result
    }

    // Not sure why a default argument didn't work in the above function 🤷‍♂️
    func padding(_ value: Double) -> AnyElement {
        padding(Side.allCases, value)
    }
}
