// Usage: Go to root directory then `swift run`
import Foundation

let siteDirectory = FileManager.default.currentDirectoryPath + "/_site"
let outputFilePath = siteDirectory + "/index.html"

print("🛠️  Starting to generate the site...")

do {
    print("🔍 Collecting all notes...")
    let allNotes = try allNotes()
    print("📦 Collected all notes!")

    print("🖍️  Generating HTML...")
    let html = renderHtml(usingNotes: allNotes) // This is a free function from this module
    if let data = html.data(using: .utf8) {
        try data.write(to: URL(fileURLWithPath: outputFilePath), options: [])
        print("🚀 Finished generating site! Output is in: \(siteDirectory)")
    } else {
        print("❌ Failed to write generated site out to: \(outputFilePath)")
        exit(1)
    }
} catch {
    print("❌ Failed to build and generate site. Error: \(error)")
    exit(1)
}
