import SwiftHtmlCss

struct SiteNote: HtmlProvider {
    let html: HtmlNode

    // TODO: take in date type
    init(title: String, date: String, body: String, codeSnippet: String) {
        html =
            Div {
                Div {
                    H1(title)
                    P(date)
                        .color(.mediumGray)
                }
                .padding([.bottom], 8)
                .lineHeight(0.5)
                P(body)
                Pre {
                    Code {
                        // FIXME: this is a hack. The code snippet is html, so it shouldn't be embedded in anythign.
                        P(codeSnippet)
                            .padding(0)
                            .margin(0)
                    }
                }
            }
            .textAlign(.left)
            .lineHeight(1.4)
            .background(.color(.darkGray))
            .borderRadius(px: 32)
            .color(.lightGray)
            .padding([.leading, .trailing], 24)
            .padding([.top, .bottom], 12)
            .margin([.bottom], 24)
            .html
    }
}
