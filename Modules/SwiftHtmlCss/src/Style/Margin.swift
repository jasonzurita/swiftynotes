// May need to be updated later to apply to select elements because
// of the below spec note: https://www.w3.org/TR/CSS2/box.html#propdef-margin
// Applies to: all elements except elements with table display types other than table-caption, table and inline-table

public extension HtmlProvider {
    func margin(_ sides: [Side], _ value: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs
            if Set(Side.allCases).isSubset(of: sides) {
                newAttrs[.style, default: ""] += "margin: \(value)px;"
            } else {
                for side in sides {
                    newAttrs[.style, default: ""] += "\(side.margin): \(value)px;"
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
    func margin(_ value: Double) -> AnyElement {
        margin(Side.allCases, value)
    }
}
