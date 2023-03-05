let favoriteColors = ["Blue", "Yellow", "Red", "Orange"]

func printFavoriteColors() {
    
    // Using enumerated: for loop
    for (index, favorite) in favoriteColors.enumerated() {
        let place = index + 1 // add 1 since enumerated starts at 0
        print("\(place): " + favorite) // 1: Blue, 2: Yellow, 3: Red, 4: Orange
    }

    // Using enumerated: `forEach` higher-order function
    favoriteColors.enumerated().forEach { index, favorite in
        let place = index + 1
        print("\(place): " + favorite) // same result as the for loop
    }
}
