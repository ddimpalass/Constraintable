// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Constraintable",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Constraintable",
            targets: ["Constraintable"]),
    ],
    targets: [
        .target(name: "Constraintable")
    ]
)
