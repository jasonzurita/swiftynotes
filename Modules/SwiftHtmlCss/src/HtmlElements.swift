// TODO:
// - lower case below elements?

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
    public var html: HtmlNode

    // Can we limit the elements that go in here?
    public init(_ copy: String, @HtmlBuilder content: () -> [HtmlNode] = { [] }) {
        self.html = HtmlNode.element("p", attrs: [], copy: copy, content())
    }
}

public struct H1: HtmlProvider {
    public var html: HtmlNode

    public init(_ copy: String) {
        self.html = HtmlNode.element("h1", attrs: [], copy: copy, [])
    }
}

public struct H2: HtmlProvider {
    public let html: HtmlNode

    public init(_ copy: String) {
        self.html = HtmlNode.element("h2", attrs: [], copy: copy, [])
    }
}

public struct A: HtmlProvider {
    public var html: HtmlNode

    // TODO:  make url type?
    public init(copy: String, url: String) {
        let href = ("href", url)
        self.html = HtmlNode.element("a", attrs: [href], copy: copy, [])
    }
}
