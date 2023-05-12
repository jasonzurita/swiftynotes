enum PasswordValidation: Error {
    case invalidAndUnknown
}

func isPasswordValid(_ password: String?) throws -> Bool {

    // Throwing is a possible way to guarantee an early exit (if the function is throwing)
    // If password isn't nil, the guard passes and unwraps "password" to be used as non-optional
    guard let password else { throw PasswordValidation.invalidAndUnknown }

    // These guards provide boolean early returns (per the return type of this function)
    guard password.isEmpty else { return false }
    guard password.count > 8 else { return false }

    // The compiler can still guarantee that this guard will exit early - because this will crash...
    guard password == "1234" else { fatalError() }

    // Below will not compile because there is no early exit in the "else" clause
    // Error: 'guard' body must not fall through, consider using a 'return' or 'throw' to exit the scope
    // guard password.contains(where: { char in char == "!"}) else { }

    return true
}
