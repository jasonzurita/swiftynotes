struct ViewData {
    let title: String
    let onAccept: () -> Void

    var userInput: String? {
        // Called before _userInput_ is set (the new value is provided)
        // Note: "newValue" can be renamed like this -> willSet(<name>)
        willSet {
            print("willSet: \(newValue ?? "nil")")
        }

        // Called after a _userInput_ is set (the old value is provided)
        // Note: "oldValue" can be renamed like this -> didSet(<name>)
        didSet {
            print("didSet: \(oldValue ?? "nil")")
        }
    }
}
