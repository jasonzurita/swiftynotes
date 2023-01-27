import Foundation

// example entity
struct User {
    let id: UUID
    let name: String
    let email: String
}

extension User {
    // convenience
    static var randomId: User {
        User(
            id: UUID(),
            name: "Rob",
            email: "rob@rob.com"
        )
    }
}

let users: [User] = [.randomId, .randomId, .randomId, .randomId]

// This is not point-free since the value `$0` is used
let userIds = users.map { $0.id }

// No mention of the value on which the function is acting
let userIds2 = users.map(\.id)
