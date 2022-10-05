public extension HtmlProvider {
    func margin(_ sides: [Side], _ value: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, _, nodes):
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
