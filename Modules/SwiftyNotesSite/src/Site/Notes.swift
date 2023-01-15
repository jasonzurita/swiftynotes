import SwiftHtmlCss

struct SiteNotes: HtmlProvider {
    let html: HtmlNode

    init() {
        // TODO: better automation
        // - Get all the notes
        // - Derive the date from the file names
        // - Generate code snippets

        let codeSnippet = codeSnippet(withName: "2023_1_13-constants-and-variables.swift")

        // TODO: where should the title and body live?
        html =
        Div {
            SiteNote(
                title: "Defining Constants and Variables",
                // TODO: make it this dynamic based on note date
                // TODO: look at date before making note public
                date: "January 13, 2023",
                body: "Constants and Variables need to start with the \"let\" and \"var\" keywords respectively. Constants cannot be changed after being set (immutable) while variables can be changed (mutable).",
                codeSnippet: codeSnippet
            )
        }
        .margin([.top], 48)
        .maxWidth(percent: 80)
        .margin([.trailing, .leading], .auto)
        .html
    }
}
