import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes")
            Body {
                SiteHeader()
                P("Being built using an evolving Swift HTML result builder")
                Footer {
                    P("This site is ") {
                        A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
                    }
                }
                .textAlign(.center)
                .color(.darkGray)
            }
            .background(.gray)
            .font(.apple)
            .textAlign(.center)
            .margin(0)
            .padding(0)
        }
    return site.html.render
}
