public struct Html: HtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        self.html = .element("html", attrs: [], content())
    }
}

public struct Body: HtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        self.html = .element("body", attrs: [], content())
    }
}

public struct Div: HtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        self.html = .element("div", attrs: [], content())
    }
}

public struct P: HtmlProvider {
    public let html: HtmlNode

    public init(_ copy: String) {
        self.html = HtmlNode.element("p", attrs: [], copy: copy, [])
    }
}

public struct H2: HtmlProvider {
    public let html: HtmlNode

    public init(_ copy: String) {
        self.html = HtmlNode.element("h2", attrs: [], copy: copy, [])
    }
}
