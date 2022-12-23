import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes")
            Body {
                SiteHeader()
                P("Being built using an evolving Swift HTML result builder")
                Footer {
                    P("Jason Zurita &copy; 2022 | Built using an evolving Swift HTML result builder, which is") {
                        A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
                    }
                }
                .textAlign(.center)
                .color(.mediumGray)
            }
            .background(.lightGray)
            .font(.apple)
            .textAlign(.center)
            .margin(0)
            .padding(0)
        }
    return site.html.render
}
