// TODO: should this be able to configure the style string itself?
public enum BackgroundType {
    public struct LinearGradient {
        public typealias Percent = Int
        /// Informs the direction for the gradient
        let degree: Int
        /// The first color for the gradient and where to start by percentage
        let first: (Color, Percent)
        /// The second color for the gradient and where to end by percentage
        let second: (Color, Percent)

        public init(degree: Int, first: (Color, Percent), second: (Color, Percent)) {
            self.degree = degree
            self.first = first
            self.second = second
        }
    }

    case color(Color)
    case linearGradient(LinearGradient)
}
