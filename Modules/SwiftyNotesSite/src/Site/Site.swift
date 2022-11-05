import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes")
            Body {
                SiteHeader()
                P("Being built using an evolving Swift HTML result builder")
                P("This site is ") {
                    A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
                }
            }
            .background(.gray)
            .font(.apple)
            .textAlign(.center)
            .margin(0)
            .padding(0)
        }
    return site.html.render
}
