import SwiftHtmlCss

struct SiteNotes: HtmlProvider {
    let html: HtmlNode

    init(using notes: [NoteMetadata]) {
        html =
            Div {
                // FIXME: no force try here
                for note in notes {
                    if note.date.timeIntervalSinceNow <= 0 {
                        SiteNote(note)
                    }
                }
            }
            .margin([.top], 48)
            .maxWidth(percent: 80)
            .margin([.trailing, .leading], .auto)
            .html
    }
}
