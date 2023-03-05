/// Used to bubble up errors when preparing all the notes for display (html)
enum NoteDecodingError: Error {
    case missingMetadataOrSnippet
    case noteFolderNamedWithInvalidDate
    case noNoteMetadataFound
}
