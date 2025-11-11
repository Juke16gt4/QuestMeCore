// swift-tools-version: 6.2.1
import PackageDescription

let package = Package(
    name: "QuestMeCore",
    platforms: [
        .iOS(.v15), .macOS(.v12)
    ],
    products: [
        .library(
            name: "QuestMeCore",
            targets: ["QuestMeCore"]
        ),
    ],
    targets: [
        .target(
            name: "QuestMeCore",
            dependencies: []
        ),
        .testTarget(
            name: "QuestMeCoreTests",
            dependencies: ["QuestMeCore"]
        ),
    ]
)
