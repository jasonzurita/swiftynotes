enum Shapes {
    case square
    case circle
    case triangle

    // Using a default can lead to future bugs.
    // For example, adding a "pentagon" case would by default
    // return false below.
    var hasMoreThan3Sides: Bool {
        switch self {
        case .square: return true
        default: return false
        }
    }

    // This version is much better. The compiler will "ask"
    // you, via an error, to address how many sides that new
    // shape has below (aka Switch must be exhaustive).
    var betterHasMoreThan3Sides: Bool {
        switch self {
        case .square: return true
        case .circle, .triangle: return false
        }
    }
}
