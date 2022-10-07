public struct Img: HtmlProvider {
    public let html: HtmlNode

    // TODO: make src this a url?
    /// src - Specifies the path to the image
    /// alt - Specifies an alternate text for the image, if the image for some reason cannot be displayed
    public init(src: String, alt: String, attrs: [AttrType: String] = [:]) {
        var fullAttrs = attrs
        fullAttrs[.src] = src
        fullAttrs[.alt] = alt
        html = .element("img", attrs: fullAttrs, [])
    }
}
