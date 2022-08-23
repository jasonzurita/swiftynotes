// Usage: Go to root directory then `swift run Local-Website`
import Foundation

let siteDirectory = FileManager.default.currentDirectoryPath + "/_site"
let outputFilePath = siteDirectory + "/index.html"

print("Generating site...")
let html = generate() // This is a free function from this  module
guard let fileHandle = FileHandle(forWritingAtPath: outputFilePath) else {
  try? FileManager.default.createDirectory(atPath: siteDirectory,
                                           withIntermediateDirectories: false,
                                           attributes: nil)
  try? html.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
  exit(1)
}

if let data = html.data(using: .utf8) {
  fileHandle.write(data)
}
