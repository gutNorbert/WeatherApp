// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationLayer",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PresentationLayer",
            targets: ["PresentationLayer"]),
    ],
    dependencies: [
        .package(path: "../DomainLayer"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.4.3")
    ],
    targets: [
            .target(
                name: "PresentationLayer",
                dependencies: ["DomainLayer", .product(name: "Lottie", package: "lottie-spm")],
                resources: [
                    .process("Resources")
                ]
            ),
            .testTarget(
                name: "PresentationLayerTests",
                dependencies: ["PresentationLayer"]),
        ]
    
)
