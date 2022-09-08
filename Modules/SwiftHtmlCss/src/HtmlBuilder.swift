@resultBuilder
public enum HtmlBuilder {
    public static func buildBlock(_ components: HtmlProvider...) -> [HtmlNode] {
        components.map(\.html)
    }
}
