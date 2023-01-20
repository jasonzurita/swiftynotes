import Foundation

enum Route {
    case url (URL)
    case fallback
}

func showStats(using route: Route) {

    // Deferred constant assignment
    let url: URL // The compiler can guarantee that this is assigned below

    switch route {
    case let .url(routeUrl):
        url = routeUrl
    case .fallback:
        url = URL(string: "api.example.com")! // (force unwraps should be avoided)
    }

    // Make use of the url
    print(url)
}
