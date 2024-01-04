import SwiftWebsiteDSL

struct SiteNotes: HtmlProvider {
    let html: HtmlNode

    init(using notes: [NoteMetadata]) {
        html =
            Div {
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
