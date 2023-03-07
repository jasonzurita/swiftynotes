import Foundation
import Splash

// TODO: test for this
func allNotes() throws -> [NoteMetadata] {
    let thisFilesPath = #file
    let notesFolderName = "Notes"

    let notesUrl = URL(fileURLWithPath: "\(thisFilesPath)", isDirectory: false)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .appendingPathComponent(notesFolderName)

    let noteFolders = try FileManager.default.contentsOfDirectory(
        at: notesUrl,
        includingPropertiesForKeys: nil,
        options: .skipsHiddenFiles
    )

    print("👀 Found \(noteFolders.count) note folders: \(noteFolders.map(\.lastPathComponent))")
    print("👀 Looking at notes: metadata & snippets...")

    let notes = try FileManager.default.contentsOfDirectory(
        at: notesUrl,
        includingPropertiesForKeys: nil,
        options: .skipsHiddenFiles
    )
    .map {
        (
            $0.lastPathComponent, // the containing folder's name is assumed to be the date for when the note is to be published
            try FileManager.default.contentsOfDirectory(
                at: $0, includingPropertiesForKeys: nil,
                options: .skipsHiddenFiles
            )
        )
    }
    .map { (dateString: String, contentUrls: [URL]) -> NoteMetadata in
        // assume each note has some metadata like a title and body & a code snippet
        guard contentUrls.count == 2 else { throw NoteDecodingError.missingMetadataOrSnippet }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else { throw NoteDecodingError.noteFolderNamedWithInvalidDate }

        // Doesn't matter which is the metadata vs snippet. This will be handled below.
        let first = contentUrls[0]
        let second = contentUrls[1]

        let decoder = JSONDecoder()

        let noteMetadata: NoteMetadata
        if let note = try? decoder.decode(RawNoteMetadata.self, from: Data(contentsOf: first)) {
            noteMetadata = NoteMetadata(rawMetadata: note, date: date, codeSnippetHtml: try codeSnippetHtml(for: second))
        } else if let note = try? decoder.decode(RawNoteMetadata.self, from: Data(contentsOf: second)) {
            noteMetadata = NoteMetadata(rawMetadata: note, date: date, codeSnippetHtml: try codeSnippetHtml(for: first))
        } else {
            throw NoteDecodingError.noNoteMetadataFound
        }
        print("✓ Finished processing note: \(noteMetadata.title)")
        return noteMetadata
    }

    print("🔄 Sorting them from newest to oldest...")

    return notes.sorted { note1, note2 in
        note1.date > note2.date
    }
}

func codeSnippetHtml(for url: URL) throws -> String {
    let noteString = try String(contentsOf: url)
    let highlighter = SyntaxHighlighter(format: HTMLOutputFormat())
    return highlighter.highlight(noteString)
}
