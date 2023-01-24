import SwiftHtmlCss
import Foundation

enum NoteTag: String {
    case basic
    case intermediate
    case advanced
}

struct NoteMetadata {
    let title: String
    let date: String
    let body: String
    let codeSnippetName: String
    let tags: [NoteTag]
}

func allNotes() -> [NoteMetadata] {
    [
//        NoteMetadata(
//            title: <#T##String#>,
//            date: <#T##String#>,
//            body: <#T##String#>,
//            codeSnippetName: <#T##String#>
//        ),
        NoteMetadata(
            title: #"Defer assigning a "let" and avoid using "var"s"#,
            date: "January 20, 2023",
            body: #"Constants (i.e., "let"s) can have a deferred assignment (aka definite initialization) as long as the compiler can guarantee that it is assigned in every code path and only once. Useful to avoid using a "var", and a safer pattern to use since a constant can't be changed later."#,
            codeSnippetName: "2023_1_20_deferred_constant_assignment.swift",
            tags: [.intermediate]
        ),
        NoteMetadata(
            title: "Defining Constants and Variables",
            date: "January 13, 2023",
            body: #"Constants and Variables need to start with the "let" and "var" keywords respectively. Constants cannot be changed after being set (immutable) while variables can be changed (mutable)."#,
            codeSnippetName: "2023_1_13_constants_and_variables.swift",
            tags: [.basic]
        )
    ]
}

struct SiteNotes: HtmlProvider {
    let html: HtmlNode

    init() {
        // TODO: better automation
        // - Get all the notes
        // - Derive the date from the file names
        // - Generate code snippets

        let d = Date()
        if #available(macOS 12.0, *) {
            let x = d.formatted(date: .long, time: .omitted)
        } else {
            print("No date formatting")
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM DD, YYYY"
        let date = dateFormatter.date(from: "January 20, 2023")
        print("This is my date: \(date)")

        let codeSnippet1 = codeSnippet(withName: "2023_1_13_constants_and_variables.swift")
        let codeSnippet2 = codeSnippet(withName: "2023_1_20_deferred_constant_assignment.swift")

        let xx =
        [SiteNote(
            title: #"Defer assigning a "let" and avoid using "var"s"#,
            // TODO: make it this dynamic based on note date
            // TODO: look at date before making note public
            date: "January 20, 2023",
            body: #"Constants (i.e., "let"s) can have a deferred assignment (aka definite initialization) as long as the compiler can guarantee that it is assigned in every code path and only once. Useful to avoid using a "var", and a safer pattern to use since a constant can't be changed later."#,
            codeSnippet: codeSnippet2
        ),
        SiteNote(
            title: "Defining Constants and Variables",
            // TODO: make it this dynamic based on note date
            // TODO: look at date before making note public
            date: "January 13, 2023",
            body: #"Constants and Variables need to start with the "let" and "var" keywords respectively. Constants cannot be changed after being set (immutable) while variables can be changed (mutable)."#,
            codeSnippet: codeSnippet1
        )]

        html =
        Div {
            for n in allNotes() {
               P("hi")
            }
        }
        .margin([.top], 48)
        .maxWidth(percent: 80)
        .margin([.trailing, .leading], .auto)
        .html
    }
}
