// https://www.w3.org/TR/CSS22/colors.html#propdef-background

public extension HtmlProvider {
    func background(_ background: BackgroundType) -> AnyElement {
        let result: AnyElement
        switch html {
        case let .element(element, attrs: attrs, copy, nodes):
            var newAttrs = attrs

            switch background {
            case let .linearGradient(lg):
                newAttrs[.style, default: ""] +=
                    """
                    background: linear-gradient(\
                    \(lg.degree)deg,\
                    #\(lg.first.0.hex) \(lg.first.1)%,\
                    #\(lg.second.0.hex) \(lg.second.1)%\
                    );
                    """
            case let .color(color):
                newAttrs[.style, default: ""] += "background: #\(color.hex);"
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
}
