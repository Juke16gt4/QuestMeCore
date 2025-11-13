// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "QuestMeCore",
    platforms: [
        .iOS(.v16)
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
