
![Swift](https://github.com/JZDesign/Transfer/workflows/Swift/badge.svg) [![codebeat badge](https://codebeat.co/badges/d7b361b5-e7c9-45b7-8d5c-6eaffb058798)](https://codebeat.co/projects/github-com-jzdesign-transfer-main) [![SPM compatible](https://img.shields.io/badge/SPM-Compatible-e66f20.svg?style=flat)](https://github.com/apple/swift-package-manager) [![License](https://img.shields.io/badge/License-MIT-335577.svg?style=flat)](https://github.com/JZDesign/Transfer/blob/master/LICENSE) [![Docs](https://img.shields.io/badge/Jazzy-Documentation-634fb3.svg?style=flat)](https://jzdesign.github.io/Transfer/)

![Transfer. Swifty Server Side HTML generation & templating in Swift](https://lucid.app/publicSegments/view/f6de9a35-dbb0-426a-abc2-800c4143863c/image.jpeg)


## SPM 

```swift
dependencies: [
    .package(url: "https://github.com/JZDesign/Transfer.git", .upToNextMajor(from: "0.01.0"))
],
```

## Usage

### A simple overview

```swift
let head = Head(
        title: "Title", 
        headContent: .styleSheet("styles/someThing.css"), .favicon()
    )

Page(head: head)
    .rendered(withBody: 
        .h1("This is your title"),
        .div(someDivContent, cssClass: "container")
        )
```


![Rendered HTML Result](img/rendered_html.png)

### Using Transfer in a [Vapor](https://github.com/vapor/vapor) project

This package intentionally has no dependencies, and therefore does not wrap anything for convenience in Vapor. To use Transfer with Vapor, add this extension to your project.

```swift
import Vapor

extension Request {
    func transfer(_ html: String) -> EventLoopFuture<Response> {
        eventLoop.makeSucceededFuture(Response(status: .ok, headers: HTML_CONTENT_HEADER, body: Response.Body(string: html)))
    }
}
```

Then you can render a page like:

```swift
// in Routes.swift

app.get("site") {
        $0.transfer(
            Page(head: Head(title: "Some Title", headContent: [])).rendered("<h1>Hey!</h1>")
        )
    }
```
