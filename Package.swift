// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Animatables",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "Animatables", targets: ["Animatables"]),
    ],
    targets: [
        .target(name: "Animatables", path: "Sources/"),
    ]
)
