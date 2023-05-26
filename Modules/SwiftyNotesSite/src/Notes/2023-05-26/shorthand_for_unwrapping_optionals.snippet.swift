func greet(userName: String?) {
    // Previous way -> if let userName = userName
    if let userName {
        print("Hello \(userName)!")
    } else {
        print("Hello!")
    }
}

func addMoney(amount: Double?, to otherAmount: Double) -> Double {
    // Previous way -> guard let amount = amount else {...
    guard let amount else { return otherAmount }
    return amount + otherAmount
}
