// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Transfer",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "Transfer", targets: ["Transfer"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Transfer",
            dependencies: []),
        .testTarget(
            name: "TransferTests",
            dependencies: ["Transfer"]),
    ]
)
