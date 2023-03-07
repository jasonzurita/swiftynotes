import Foundation
import SwiftHtmlCss

struct SiteNote: HtmlProvider {
    let html: HtmlNode

    // TODO: take in date type
    init(_ metadata: NoteMetadata) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"

        html =
            Div {
                Div {
                    H1(metadata.title)
                    P(dateFormatter.string(from: metadata.date))
                        .color(.mediumGray)
                }
                .padding([.bottom], 8)
                .lineHeight(0.5)
                P(metadata.body)
                Pre {
                    Code {
                        // FIXME: this is a hack. The code snippet is html, so it shouldn't be embedded in anything.
                        P(metadata.codeSnippetHtml)
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
