import Foundation
import Splash

// TODO: test for this
// TODO: don't return empty string if this fails
func codeSnippet(withName name: String) -> String {
    // TODO: test for this
    let noteFolderName = "CodeSnippets"
    let thisFilesPath = #file
    let noteUrl = URL(fileURLWithPath: "\(thisFilesPath)", isDirectory: false)
        .deletingLastPathComponent()
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
