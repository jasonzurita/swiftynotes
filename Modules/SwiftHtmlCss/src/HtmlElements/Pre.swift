public struct Pre: BlockHtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("pre", attrs: [:], content())
    }
}
