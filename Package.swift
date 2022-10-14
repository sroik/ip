// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "IP",
    platforms: [.iOS(.v11), .macOS(.v10_13)],
    products: [
        .library(
            name: "IP",
            targets: ["IP"]
        ),
    ],
    targets: [
        .target(
            name: "IP",
            dependencies: []
        ),
        .testTarget(
            name: "IPTests",
            dependencies: ["IP"]
        ),
    ]
)
