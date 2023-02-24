enum Animal {
    case dog(breed: String)
    case cat
}

// If you want an enum's associated value
func breedIfDog(_ maybeDog: Animal) -> String? {
    if case let .dog(breed) = maybeDog {
        return breed
    }
    return nil
}

// Or, if you don't want the associated value
func isDog(_ maybeDog: Animal) -> Bool {
    // a `guard` statement might be better here (e.g., "guard case .dog = maybeDog else { return false }")
    if case .dog = maybeDog {
        return true
    } else {
        return false
    }
}
