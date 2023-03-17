func printName() {
    let name: String? = Optional.some("Bob")

    switch name {
    case .none:
        print("Name doesn't exist")
    case let .some(name):
        print("Name is: \(name)")
    }
}
