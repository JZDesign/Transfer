![Swift](https://github.com/JZDesign/Transfer/workflows/Swift/badge.svg) [![codebeat badge](https://codebeat.co/badges/d7b361b5-e7c9-45b7-8d5c-6eaffb058798)](https://codebeat.co/projects/github-com-jzdesign-transfer-main) [![SPM compatible](https://img.shields.io/badge/SPM-Compatible-e66f20.svg?style=flat)](https://github.com/apple/swift-package-manager) [![License](https://img.shields.io/badge/License-MIT-335577.svg?style=flat)](https://github.com/JZDesign/Transfer/blob/master/LICENSE) [![Docs](https://img.shields.io/badge/Jazzy-Documentation-634fb3.svg?style=flat)](https://jzdesign.github.io/Transfer/)

<div style="float: none;"><div style="float:left;">
<h1>Transfer</h1>
<p style="max-width:300px;">Swifty Server Side HTML generation & templating in Swift
</p>
</div>
<img style="height:200px;" alt="Transfer logo, A cloud with swift bird shaped lightning" src="img/Transfer.jpg"/></div>


## SPM 

```swift
dependencies: [
    .package(url: "https://github.com/JZDesign/Transfer.git", .upToNextMajor(from: "0.01.0"))
],
```

## Usage

A simple overview

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