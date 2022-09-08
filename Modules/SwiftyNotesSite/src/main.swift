// Usage: Go to root directory then `swift run Local-Website`
import Foundation

let siteDirectory = FileManager.default.currentDirectoryPath + "/_site"
let outputFilePath = siteDirectory + "/index.html"

print("Generating site...")

let html = renderHtml() // This is a free function from this  module

if let data = html.data(using: .utf8) {
    do {
        try data.write(to: URL(fileURLWithPath: outputFilePath), options: [])
        print("Success!")
    } catch {
        print("[FAILURE] - Failed to write to: \(outputFilePath)")
    }
} else {
    print("[FAILURE] - Failed to convert html to data")
    exit(1)
}
