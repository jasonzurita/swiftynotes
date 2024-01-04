import Splash
import SwiftWebsiteDSL

// TODO: custom style guide for code

func renderHtml(usingNotes notes: [NoteMetadata]) -> String {
    let site =
        Html {
            Head(title: "SwiftyNotes", cssStyleFileName: "CodeColors.css")
            Body {
                SiteHeader()
                SiteNotes(using: notes)
                Footer {
                    P("Jason Zurita &copy; 2023 | Built in Swift and ") {
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
