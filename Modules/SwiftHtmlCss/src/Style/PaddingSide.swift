import Foundation

public enum PaddingSide: CaseIterable {
    case top, bottom, leading, trailing

    public static var all: Set<PaddingSide> = [.top, .bottom, .leading, .trailing]

    var style: String {
        switch self {
        case .top: return "padding-top"
        case .bottom: return "padding-bottom"
        case .leading: return "padding-left"
        case .trailing: return "padding-right"
        }
    }
}