import Foundation

// With explicit optional target naming
func validateUserInput(title: String?, subtitle: String?, price: Int?) -> Bool {
    guard
      let title = title,
      let subtitle = subtitle,
      let price = price
    else {
      return false
    }

    return title.count > 5 && subtitle.count > 10 && price > 0
}

// With optional target and result naming combined
func validateUserInput2(title: String?, subtitle: String?, price: Int?) -> Bool {
    guard let title, let subtitle, let price else {
      return false
    }

    return title.count > 5 && subtitle.count > 10 && price > 0
}
