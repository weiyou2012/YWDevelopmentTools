// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "YWDevelopmentTools",
    products: [
        .library(
            name: "YWDevelopmentTools",
            targets: ["YWDevelopmentTools"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        .target(
            name: "YWDevelopmentTools",
            dependencies: []),
        .testTarget(
            name: "YWDevelopmentToolsTests",
            dependencies: ["YWDevelopmentTools"]),
    ]
)
