public struct Img: HtmlProvider {
    public let html: HtmlNode

    // TODO: make this a url?
    public init(src: String) {
        html = .element("img", attrs: [.src: src], [])
    }
}
