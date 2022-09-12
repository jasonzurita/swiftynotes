import SwiftHtmlCss

func renderHtml() -> String {
    let site =
    Html {
        Body {
            H1("let hello = \"world\"")
            P("Built using a Swift HTML result builder.")
            P("This site is ") {
                A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
            }
        }
    }
    return site.html.render
}
