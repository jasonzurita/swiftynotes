struct Profile {}
struct Stats {}

// Weak - Using a returned optional hides failure or error information
func stats(for profile: Profile) -> Stats? {
    // Get stats (e.g., database, network, cache)
    // If the above fails, the returned value of nil hides why
    return nil
}

// Preferred - Using an enum helps convey more information
enum RetrievedStats {
    case stats(Stats)
    case noneFound

    // More cases can be easily added over time as new ways to get stats are added!
    case databaseConnectionIssue
    case networkFailure // maybe with status code
}

func stats(for profile: Profile) -> RetrievedStats {
    // Get stats (e.g., database, network, cache)
    return .noneFound
}
