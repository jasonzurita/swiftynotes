// https://forums.swift.org/t/multi-line-string-nested-indentation-with-interpolation/36933/2
extension DefaultStringInterpolation {
    mutating func appendInterpolation(indented string: String) {
        let indent = String(stringInterpolation: self).reversed().prefix { " \t".contains($0) }
        if indent.isEmpty {
            appendInterpolation(string)
        } else {
            appendLiteral(string.split(separator: "\n", omittingEmptySubsequences: false).joined(separator: "\n" + indent))
        }
    }
}
