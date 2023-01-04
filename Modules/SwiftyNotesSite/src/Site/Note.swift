import SwiftHtmlCss

struct SiteNote: HtmlProvider {
    let html: HtmlNode

    // TODO: take in date type
    init(title: String, date: String, body: String, sourceFileName: String) {
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
                P(noteSourceCode(withName: sourceFileName))
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
