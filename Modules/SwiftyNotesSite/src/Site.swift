import SwiftHtmlCss

func renderHtml() -> String {
    let site =
    Html {
        Body {
            H2("let hello = \"world\"")
            P("Built using a Swift HTML result builder.")
        }
    }
    return site.html.render
}
