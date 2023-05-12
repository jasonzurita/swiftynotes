enum FoodGroup {
    case fruits, grains, protein, vegetables
}

// no food to eat :(
let availableFood: [FoodGroup: [String]] = [:]

// Using a default value - we don't have to deal with the value being optional
func quantityToEat(for group: FoodGroup) -> Int {
    return availableFood[group, default: []].count
}

// Without a default value - we need to deal with the optional
func quantityToEat2(for group: FoodGroup) -> Int {
    return (availableFood[group] ?? []).count
}
