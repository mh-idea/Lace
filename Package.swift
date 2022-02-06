// swift-tools-version:5.5
// Managed by ice

import PackageDescription

let package = Package(
    name: "Lace",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "lace", targets: ["Lace"]),
        .library(name: "LaceKit", targets: ["LaceKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.1"),
        .package(url: "https://github.com/kylef/PathKit", from: "1.0.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.1"),
    ],
    targets: [
        .executableTarget(name: "Lace", dependencies: ["LaceCLI"]),
        .target(name: "LaceCLI", dependencies: ["LaceKit", "Rainbow", "PathKit", "SwiftCLI"]),
        .target(name: "LaceKit", dependencies: ["Rainbow", "PathKit", "SwiftCLI"]),
        .testTarget(name: "LaceTests", dependencies: ["Lace"]),
    ]
)
