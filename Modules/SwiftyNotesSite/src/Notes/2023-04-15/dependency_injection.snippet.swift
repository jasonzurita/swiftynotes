import Foundation

struct Event {
    let Date: Date
}

func time(fromNow now: () -> Date, to event: Event) -> TimeInterval {
    // Injecting a way to get the current date will be useful for testing, it makes
    // the dependency more obvious for this function, and helps the readability.
    // By "injecting" the current time, we can "control" the current time, the resulting
    // returned time interval, and create a reliable test for the internals here.

    // Calculate the time interval
    return .zero
}
