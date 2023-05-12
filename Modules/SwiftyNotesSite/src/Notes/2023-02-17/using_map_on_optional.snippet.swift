// Without using "map"
func upperCase(userInput input: String?) -> String? {
    if let input {
        return input.uppercased()
    }
    return nil
}

// Using "map"
func upperCase2(userInput input: String?) -> String? {
    // this can probably just be inlined where needed now
    input.map { $0.uppercased() }
}
