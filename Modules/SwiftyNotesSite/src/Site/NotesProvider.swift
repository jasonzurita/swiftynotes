import Foundation
import Splash

// TODO: test for this
// TODO: don't return empty string if this fails
func noteSourceCode(withName name: String) -> String {
    let noteFolderName = "Notes"
    let thisFilesPath = #file
    let noteUrl = URL(fileURLWithPath: "\(thisFilesPath)", isDirectory: false)
        .deletingLastPathComponent()
        .appendingPathComponent(noteFolderName)
        .appendingPathComponent("\(name)")

    do {
        let noteString = try String(contentsOf: noteUrl)
        let highlighter = SyntaxHighlighter(format: HTMLOutputFormat())
        let noteHtml = highlighter.highlight(noteString)
        return noteHtml
    } catch {
        print(error.localizedDescription)
        return ""
    }
}
