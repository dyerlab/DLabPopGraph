// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DLabPopGraph",
    platforms: [ .iOS( .v17 ), .macOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DLabPopGraph",
            targets: ["DLabPopGraph"]),
    ],
    dependencies: [
        .package(url: "https://github.com/dyerlab/DLabMatrix", .upToNextMajor(from: "1.0.3")),
        .package(url: "https://github.com/dyerlab/GeoSpatial", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DLabPopGraph",
            dependencies: ["DLabMatrix"] ),
        .testTarget(
            name: "DLabPopGraphTests",
            dependencies: ["DLabPopGraph", "DLabMatrix"]
        ),
    ]
)
