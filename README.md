[![codebeat badge](https://codebeat.co/badges/d7b361b5-e7c9-45b7-8d5c-6eaffb058798)](https://codebeat.co/projects/github-com-jzdesign-transfer-main) [![SPM compatible](https://img.shields.io/badge/SPM-Compatible-e66f20.svg?style=flat)](https://github.com/apple/swift-package-manager) [![License](https://img.shields.io/badge/License-MIT-335577.svg?style=flat)](https://github.com/JZDesign/Transfer/blob/master/LICENSE)

# Transfer

Swifty Server Side HTML generation & templating in Swift



```swift
let body = [
    TransferElement(element: .h1, content: "This is your title"),
    TransferElement(element: .div, attributes: [.class(value: "container")], content: someDivContent)
]

let head = Head(
        title: "Title", 
        headContent: .styleSheet("styles/someThing.css"), .favicon()
    )

Page(head: head).rendered(withBody: body)
```


![Rendered HTML Result](img/rendered_html.png)