// TODO:
// - lower case below elements?

public struct Html: HtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("html", attrs: [:], content())
    }
}

public struct Div: HtmlProvider {
    public let html: HtmlNode

    public init(@HtmlBuilder content: () -> [HtmlNode]) {
        html = .element("div", attrs: [:], content())
    }
}

// TODO: inline links
public struct P: HtmlProvider {
    public var html: HtmlNode

    // Can we limit the elements that go in here?
    public init(_ copy: String, @HtmlBuilder content: () -> [HtmlNode] = { [] }) {
        html = HtmlNode.element("p", attrs: [:], copy: copy, content())
    }
}

public struct H1: HtmlProvider {
    public var html: HtmlNode

    public init(_ copy: String) {
        html = HtmlNode.element("h1", attrs: [:], copy: copy, [])
    }
}

public struct H2: HtmlProvider {
    public let html: HtmlNode

    public init(_ copy: String) {
        html = HtmlNode.element("h2", attrs: [:], copy: copy, [])
    }
}

public struct A: HtmlProvider {
    public var html: HtmlNode

    // TODO: make url type?
    public init(copy: String, url: String) {
        html = HtmlNode.element("a", attrs: [.href: url], copy: copy, [])
    }
}
