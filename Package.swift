<<<<<<< HEAD
// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tsumurajunichi",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "tsumurajunichi",
            targets: ["tsumurajunichi"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "tsumurajunichi"
        ),
        .testTarget(
            name: "tsumurajunichiTests",
            dependencies: ["tsumurajunichi"]

// swift-tools-version: 6.2.1
=======
// swift-tools-version:5.9
>>>>>>> feature/voice-enhancement
import PackageDescription

let package = Package(
    name: "QuestMeCore",
    platforms: [
<<<<<<< HEAD
        .iOS(.v16), .macOS(.v12)
=======
        .iOS(.v16)
>>>>>>> feature/voice-enhancement
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
<<<<<<< HEAD
            
             origin/feature/companion-module
        ),
=======
        )
>>>>>>> feature/voice-enhancement
    ]
)
