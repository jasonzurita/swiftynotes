import Splash
import SwiftHtmlCss

// TODO: custom style guide for code

func renderHtml() -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes")
            Body {
                SiteHeader()
                Div {
                    SiteNote(
                        title: "Defining Constants and Variable",
                        // TODO: make it this dynamic based on note date
                        // TODO: look at date before making note public
                        date: "January 4, 2023",
                        body: "Constants and Variables need to start with the \"let\" and \"var\" keywords respectively. Constants cannot be changed after being set (immutable) while variables can be changed (mutable).",
                        // TODO: make it so all notes are pulled in. Probably in the "main" file and we can bail if no notes are found
                        sourceFileName: "2023_1_4-constants-and-variables.swift"
                    )
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
