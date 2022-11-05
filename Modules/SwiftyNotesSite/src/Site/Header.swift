import SwiftHtmlCss

struct SiteHeader: HtmlProvider {
    public let html: HtmlNode = {
        Header {
            Img(src: "images/logo.svg", alt: "let hello = \"world\"")
                .padding([.top], 50)
                .width(500)
            P("One minute Swift reads to get Swifty-er")
                .color(.white)
        }
        .background(
            .linearGradient(.init(degree: 180, first: (.headerTopBlue, 0), second: (.headerBottomBlue, 100)))
        )
        .padding([.bottom], 50)
        // TODO: work on this quirk where we shouldn't need to call `.html` after
        .html
    }()
}
