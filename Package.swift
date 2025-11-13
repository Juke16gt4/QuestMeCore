// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "QuestMeCore",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "QuestMeCore",
            targets: ["QuestMeCore"]
        )
    ],
    targets: [
        .target(
            name: "QuestMeCore",
            dependencies: []
        ),
        .testTarget(
            name: "QuestMeCoreTests",
            dependencies: ["QuestMeCore"]
        )
    ]
)
