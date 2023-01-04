import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes")
            Body {
                SiteHeader()
                Div {
                    Div {
                        Div {
                            H1("Defining Constants and Variable")
                            P("December 28, 2022")
                                .color(.mediumGray)
                        }
                        .padding([.bottom], 8)
                        .lineHeight(0.5)
                        P("Constants and Variables need to start with the keyword \"let\" or \"var\" respectively.")
                        P("Being built using an evolving Swift HTML result builder")
                    }
                    .textAlign(.left)
                    .lineHeight(1.4)
                    .background(.color(.darkGray))
                    .borderRadius(px: 32)
                    .color(.lightGray)
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 12)
                    .margin([.bottom], 24)

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
