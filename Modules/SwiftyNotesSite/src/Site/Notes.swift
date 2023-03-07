import SwiftHtmlCss

struct SiteNotes: HtmlProvider {
    let html: HtmlNode

    init(using notes: [NoteMetadata]) {
        html =
            Div {
                // TODO: look at date before making note public
                // FIXME: no force try here
                for note in notes {
                    SiteNote(note)
                }
            }
            .margin([.top], 48)
            .maxWidth(percent: 80)
            .margin([.trailing, .leading], .auto)
            .html
    }
}
