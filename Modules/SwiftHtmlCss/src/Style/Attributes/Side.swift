import Foundation

public enum Side: CaseIterable {
    case top, bottom, leading, trailing

    var padding: String {
        switch self {
        case .top: return "padding-top"
        case .bottom: return "padding-bottom"
        case .leading: return "padding-left"
        case .trailing: return "padding-right"
        }
    }

    var margin: String {
        switch self {
        case .top: return "margin-top"
        case .bottom: return "margin-bottom"
        case .leading: return "margin-left"
        case .trailing: return "margin-right"
        }
    }
}
