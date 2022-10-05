public enum Font {
    case apple
    case custom(String)

    var style: String {
        switch self {
        case .apple: return "font-family: -apple-system"
        case let .custom(custom): return custom
        }
    }
}
