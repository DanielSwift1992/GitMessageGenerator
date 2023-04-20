// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitMessageGeenrator",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/adamrushy/OpenAISwift.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "GitMessageGeenrator",
            dependencies: ["OpenAISwift"]
        ),
        .testTarget(
            name: "GitMessageGeenratorTests",
            dependencies: ["GitMessageGeenrator"]
        )
    ]
)

