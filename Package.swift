// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftUIReplicator",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(name: "SwiftUIReplicator", targets: ["SwiftUIReplicator"])
    ],
    targets: [
        .target(name: "SwiftUIReplicator"),
        .testTarget(
            name: "SwiftUIReplicatorTests",
            dependencies: ["SwiftUIReplicator"])
    ]
)
