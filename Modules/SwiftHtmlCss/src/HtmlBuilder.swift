@resultBuilder
public enum HtmlBuilder {
    public static func buildBlock(_ components: HtmlProvider...) -> [HtmlNode] {
        components.map(\.html)
    }

    public static func buildArray(_ components: [[HtmlProvider]]) -> [HtmlNode] {
        fatalError()
    }
}
