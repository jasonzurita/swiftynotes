public struct Code: BlockHtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("code", attrs: [:], content())
    }
}
