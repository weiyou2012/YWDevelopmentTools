// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "YWDevelopmentTools",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "YWDevelopmentTools",
            targets: ["YWDevelopmentTools"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "YWDevelopmentTools",
            dependencies: []),
        .testTarget(
            name: "YWDevelopmentToolsTests",
            dependencies: ["YWDevelopmentTools"]),
    ]
)
