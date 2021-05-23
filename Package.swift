// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftUIReplicator",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "SwiftUIReplicator", targets: ["SwiftUIReplicator"])
    ],
    targets: [
        .target(name: "SwiftUIReplicator", path: "SwiftUIReplicator")
    ]
)
