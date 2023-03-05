// Note: this struct represents the raw json for each note. This is used to decode that
// json directly using Decodable
struct RawNoteMetadata: Decodable {
    let title: String
    let body: String
    let tags: [NoteTag]
}
