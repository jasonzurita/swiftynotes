![example workflow](https://github.com/jasonzurita/swiftynotes/actions/workflows/tests.yml/badge.svg)

<p align="center" style="font-size:8px">
    <img src="https://user-images.githubusercontent.com/13800855/220510631-e7d97713-6dae-492c-870a-ffa1b8a5b93e.png#gh-light-mode-only" width="500px" alt="SwiftyNotes"/>
    <img src="https://user-images.githubusercontent.com/13800855/220510700-d963d541-e553-4b64-9e5b-b35b6a741065.png#gh-dark-mode-only" width="500px" alt="SwiftyNotes"/>
</p>

---

SwiftyNotes is a [website](https://swiftynotes.com), built using the [Swift programming language](https://www.swift.org), to provide quick _idiomatic tips_ on the Swift language—aka writing _Swifty_ code (yes, Swifty is a real term used). This repo contains the code that generates the website using the [swift-website-dsl](https://github.com/jasonzurita/swift-website-dsl) library. There are some pretty nerdy things in here to check out such as the fact that the code snippets are 100% valid Swift that are compiled before the site is generated.

I've learned so much from the Swift community. My hope is to give a little back with this project.

Contributions of any kind are most welcome. Even feel free to [contribute a new tip](#contribute-a-tip) 🤓.

# Contribute a Swift Tip
If interested, create a pull request (PR) with a tip of your own! The below sections will help you get started with the code base, but here are the high level steps to contribute a new tip.
1. Create a new folder in the [Notes](./Modules/SwiftyNotesSite/src/Notes) folder named with the date to publish your tip (format: yyyy-mm-dd).
1. Add the tip's metadata json file. This is the content for the tip (e.g., title and body). [Here is an example](./Modules/SwiftyNotesSite/src/Notes/2023-02-24/if_case_let_syntax.snippet.metadata.json).
1. Add the tip's code snippet. This needs to be valid Swift code and should compliment the metadata above. [Here is an example](./Modules/SwiftyNotesSite/src/Notes/2023-02-24/if_case_let_syntax.snippet.swift).
1. Make sure your tip is generated as expected by following the below [getting started](#getting-started) guide.
1. Make a PR with your new tip!

## Getting Started
To test out the SwiftyNotes website locally
- Open terminal
- Clone this repo
  + `git clone https://github.com/jasonzurita/swiftynotes`
- Change directories to the cloned project
  + `cd <path>/swiftynotes`
- Generate the website
  + `swift run`
- Open the generated website in your browser
  + `open _site/index.html`

That's it 🥳. Make changes to the site, do a `swift run`, and refresh your browser!

# Tech Stack

As mentioned, this website is generated using the [swift-website-dsl](https://github.com/jasonzurita/swift-website-dsl) library. This library is a reflection of the HTML spec codified and created to feel like SwiftUI in syntax.

**Example from the SwiftyNotes site:**
```swift
Html {
    Head(title: "SwiftyNotes", cssStyleFileName: "CodeColors.css")
    Body {
        SiteHeader()
        SiteNotes()
        Footer {
            P("Jason Zurita &copy; 2024 | Built in Swift and ") {
                A(copy: "open source.", url: "https://github.com/jasonzurita/swiftynotes")
            }
        }
        .textAlign(.center)
        .color(.mediumGray)
    }
    .font(.apple)
    .textAlign(.center)
    .background(.color(.lightGray))
    .margin(0)
    .padding(0)
}
```

[The website module](./Modules/SwiftyNotesSite/src) consumes the above HTML eDSL. The result is a fully Swift defined site along with styling. When `swift run` is invoked, this module runs as an executable and [generates HTML](https://github.com/jasonzurita/swiftynotes/blob/5e0c0d977e13b0b3c995b44df63c152c7a759f43/Modules/SwiftyNotesSite/src/main.swift#L9) that is ready to be statically hosted and consumed by browsers.

## Deployment
The SwiftyNotes site is hosted using [CloudFlare pages](https://pages.cloudflare.com) as a static website. When a new commit is _pushed_ to the main branch, [GitHub Actions](./.github/workflows/publish.yml) runs the tests, builds the website, and then uploads the generated site (in the `_site` directory) to CloudFlare to host it. Pretty much that simple.


