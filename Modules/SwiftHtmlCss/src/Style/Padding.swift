public extension HtmlProvider {
    func padding(_ sides: [Side], _ value: Double) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, _, nodes):
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
