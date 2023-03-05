import Foundation

// Implicit error in the catch block
func retrievePost(url: URL) {
    do {
        let post = try String(contentsOf: url)
        print(post) // do something with the post
    } catch {
        // notice no error was defined
        print(error.localizedDescription)
    }
}

// The error can be explicitly named
func retrievePost2(url: URL) {
    do {
        let post = try String(contentsOf: url)
        print(post) // do something with the post
    } catch let postError {
        print(postError.localizedDescription)
    }
}
