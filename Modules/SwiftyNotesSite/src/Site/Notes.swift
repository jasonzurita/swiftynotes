import SwiftHtmlCss

struct SiteNotes: HtmlProvider {
    let html: HtmlNode

    init() {
        // TODO: better automation
        // - Get all the notes
        // - Derive the date from the file names
        // - Generate code snippets

        let codeSnippet4 = codeSnippet(withName: "2023_2_3_looping_an_array_with_enumerated.swift")
        let codeSnippet3 = codeSnippet(withName: "2023_1_27_point-free_style.swift")
        let codeSnippet2 = codeSnippet(withName: "2023_1_20_deferred_constant_assignment.swift")
        let codeSnippet1 = codeSnippet(withName: "2023_1_13_constants_and_variables.swift")

        // TODO: where should the title and body live?
        html =
        Div {
            SiteNote(
                title: "Looping through an array with an index",
                date: "February 2, 2023",
                body: #"""
                Using `.enumerated()` on an array will return a pair of index & element for use in each iteration of the loop.<br><br>
                Note: Not all collections use zero-based and integer indicies. For example, if you have a set, then `.enumerated()` won't function the same. There isn't an order to sets. In this case, the "index" mentioned above is more of a "counter" for an undefined order.
                """#,
                codeSnippet: codeSnippet4
            )
            SiteNote(
                title: "Using key paths for a cleaner style (point-free notation)",
                // TODO: make it this dynamic based on note date
                // TODO: look at date before making note public
                date: "January 27, 2023",
                body: #"We can make code a little cleaner by using point-free style. This means that we avoid referring to the value in a function (aka a "point"). Key paths let us use this style since they allow us to access a nested property."#,
                codeSnippet: codeSnippet3
            )
            SiteNote(
                title: #"Defer assigning a "let" and avoid using "var"s"#,
                // TODO: make it this dynamic based on note date
                // TODO: look at date before making note public
                date: "January 20, 2023",
                body: #"Constants (i.e., "let"s) can have a deferred assignment (aka definite initialization) as long as the compiler can guarantee that it is assigned in every code path and only once. Useful to avoid using a "var", and a safer pattern to use since a constant can't be changed later."#,
                codeSnippet: codeSnippet2
            )
            SiteNote(
                title: "Defining Constants and Variables",
                // TODO: make it this dynamic based on note date
                // TODO: look at date before making note public
                date: "January 13, 2023",
                body: #"Constants and Variables need to start with the "let" and "var" keywords respectively. Constants cannot be changed after being set (immutable) while variables can be changed (mutable)."#,
                codeSnippet: codeSnippet1
            )
        }
        .margin([.top], 48)
        .maxWidth(percent: 80)
        .margin([.trailing, .leading], .auto)
        .html
    }
}
