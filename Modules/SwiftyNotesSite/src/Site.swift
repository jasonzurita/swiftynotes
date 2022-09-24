import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Body {
                Header {
                    H1("let hello = \"world\"")
                }
                .padding([.bottom], 50)

                P("Built using a Swift HTML result builder.")
                P("This site is ") {
                    A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
                }
            }
            .margin(0)
            .background(.gray)
            .font(.apple)
        }
    return site.html.render
}
