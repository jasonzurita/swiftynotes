import Foundation

/// The full type for the note that is passed around. This contains all the pertinent information related to a note such as the code snippet.
struct NoteMetadata {
    let title: String
    let date: Date
    let body: String
    let codeSnippetHtml: String
    let tags: [NoteTag]
}

extension NoteMetadata {
    /// Convenience initializer that can take in raw note metadata and roll that into the full metadata type
    init(rawMetadata: RawNoteMetadata, date: Date, codeSnippetHtml: String) {
        title = rawMetadata.title
        self.date = date
        body = rawMetadata.body
        self.codeSnippetHtml = codeSnippetHtml
        tags = rawMetadata.tags
    }
}
