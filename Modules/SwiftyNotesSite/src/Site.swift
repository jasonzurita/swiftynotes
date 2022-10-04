import SwiftHtmlCss

func renderHtml() -> String {
    let site =
        Html {
            Body {
                Header {
                    H1("let hello = \"world\"")
                }
                .padding([.bottom], 50)
                .background(
                    .linearGradient(.init(degree: 180, first: (.headerTopBlue, 0), second: (.headerBottomBlue, 100)))
                )

                P("Being built using an evolving Swift HTML result builder")
                P("This site is ") {
                    A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
                }
            }
            .textAlign(.center)
            .margin(0)
            .background(.gray)
            .font(.apple)
        }
    return site.html.render
}
