import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes")
            Body {
                SiteHeader()
                Div {
                    P("Being built using an evolving Swift HTML result builder")
                }
                .margin([.top], 48)
                .maxWidth(percent: 80)
                .margin([.trailing, .leading], .auto)

                Footer {
                    P("Jason Zurita &copy; 2022 | Built using an evolving Swift HTML result builder, which is") {
                        A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
                    }
                }
                .textAlign(.center)
                .color(.mediumGray)
            }
            .font(.apple)
            .textAlign(.center)
            .background(.color(.lightGray))
            .margin(0)
            .padding(0)
        }
    return site.html.render
}
