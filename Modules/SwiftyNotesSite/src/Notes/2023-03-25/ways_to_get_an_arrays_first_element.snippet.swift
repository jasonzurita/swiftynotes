struct Follower {
    // ...
}

func firstFollower() -> Follower {
    // get followers from somewhere like a backend API call
    var followers: [Follower] = [.init(), .init(), .init()]

    // == Way 1 ==
    // Using a subscript is a common way languages support getting the first item.
    // Note: This can crash if the array is empty.
    let firstFollower = followers[0]

    // == Way 2 ==
    // Use this to mutate the array itself and return the removed item for use.
    // Note: This can crash if the array is empty.
    let _ = followers.removeFirst()

    // == Way 3 ==
    // This is the safest way to get the first element since the returned item
    // is optional.
    // Note: This won't mutate the original array. Also, it will return nil if the
    // array is empty.
    let _ = followers.first

    return firstFollower
}
