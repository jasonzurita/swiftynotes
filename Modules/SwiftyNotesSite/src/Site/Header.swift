import SwiftWebsiteDSL

struct SiteHeader: HtmlProvider {
    public let html: HtmlNode = {
        Header {
            Img(src: "images/logo.svg", alt: "let hello = \"world\"")
                .padding([.top], 50)
                .width(500)
            P("One minute Swift reads to get Swifty-er")
                .color(.white)
            Div {
                // TODO: pull the swift value in from .swift-version
                P("Updated for Swift 5.8")
            }
            .textAlign(.right)
            .color(.lightGray)
            .padding([.bottom], 1)
            .padding([.top], 25)
            .padding([.trailing], 18)
        }
        .background(
            .linearGradient(.init(degree: 180, first: (.headerTopBlue, 0), second: (.headerBottomBlue, 100)))
        )
        // TODO: work on this quirk where we shouldn't need to call `.html` after
        .html
    }()
}
