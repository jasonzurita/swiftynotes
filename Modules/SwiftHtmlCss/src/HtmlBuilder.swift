@resultBuilder
public enum HtmlBuilder {
    // this is the highest level builder. All other builders like "buildArray" will
    // be given the output of this since this will be applied to that subscope before
    // the result is bubbled up to the higher level scope.
    public static func buildBlock(_ components: [HtmlProvider]...) -> [HtmlNode] {
        components.flatMap { $0 }.map(\.html)
    }

    // See note above. The output of this needs to match the input of that build block.
    // There may be a limitation becuase of this where we can't have an array or
    // for loop at the top level, but that should be an okay edge case.
    //
    // Also, `AnyElement` is used below because the type doesn't make much of a
    // difference at this point.
    public static func buildArray(_ components: [[HtmlNode]]) -> [HtmlProvider] {
        components.flatMap { $0 }.map {
            switch $0 {
            case let .element(element, attrs: attrs, copy, nodes):
                return AnyElement(
                    element: element,
                    attrs: attrs,
                    copy: copy,
                    nodes: nodes
                )
            }
        }
    }

    // This is used so that we promote all single HtmlProviders to the main currency
    // for this result builders, which is an array of HtmlProviders. See the note
    // in `buildBlock` above for its input.
    public static func buildExpression(_ expression: HtmlProvider) -> [HtmlProvider] {
        [expression]
    }

    // This makes it so we can use an array literal
    public static func buildExpression(_ expression: [HtmlProvider]) -> [HtmlProvider] {
        expression
    }

    // if/else statement support
    public static func buildEither(first component: [HtmlNode]) -> [HtmlProvider] {
        component.map {
            switch $0 {
            case let .element(element, attrs: attrs, copy, nodes):
                return AnyElement(
                    element: element,
                    attrs: attrs,
                    copy: copy,
                    nodes: nodes
                )
            }
        }
    }

    // if/else statement support
    public static func buildEither(second component: [HtmlNode]) -> [HtmlProvider] {
        component.map {
            switch $0 {
            case let .element(element, attrs: attrs, copy, nodes):
                return AnyElement(
                    element: element,
                    attrs: attrs,
                    copy: copy,
                    nodes: nodes
                )
            }
        }
    }

    // single if statement support
    public static func buildOptional(_ component: [HtmlNode]?) -> [HtmlProvider] {
        guard let c = component else { return [] }
        return c.map {
            switch $0 {
            case let .element(element, attrs: attrs, copy, nodes):
                return AnyElement(
                    element: element,
                    attrs: attrs,
                    copy: copy,
                    nodes: nodes
                )
            }
        }
    }
}
